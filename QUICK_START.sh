#!/bin/bash

# Home Landscape WordPress - Quick Start Script
# This script provides common commands for local development

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

function print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

function print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

function print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

function show_help() {
    cat << EOF
Home Landscape WordPress - Quick Start Commands

Usage: ./QUICK_START.sh [command]

Available commands:
  start       - Start WordPress and MySQL containers
  stop        - Stop all containers
  restart     - Restart containers
  logs        - Show container logs
  reset       - Stop and remove containers (keeps files)
  clean       - Remove everything including database (careful!)
  backup      - Export database backup
  import      - Import database backup
  status      - Show container status
  url         - Display WordPress URL
  help        - Show this help message

Examples:
  ./QUICK_START.sh start
  ./QUICK_START.sh logs
  ./QUICK_START.sh backup

EOF
}

case "${1:-help}" in
    start)
        print_status "Starting WordPress containers..."
        docker-compose up -d
        sleep 5
        print_success "WordPress is starting up!"
        echo ""
        print_status "WordPress: http://localhost:8000"
        print_status "Admin: http://localhost:8000/wp-admin"
        echo ""
        print_status "Waiting for WordPress to be ready (this takes ~30 seconds)..."
        for i in {1..30}; do
            if curl -s http://localhost:8000 > /dev/null 2>&1; then
                print_success "WordPress is ready!"
                break
            fi
            echo -n "."
            sleep 1
        done
        ;;

    stop)
        print_status "Stopping containers..."
        docker-compose stop
        print_success "Containers stopped"
        ;;

    restart)
        print_status "Restarting containers..."
        docker-compose restart
        print_success "Containers restarted"
        print_status "WordPress: http://localhost:8000"
        ;;

    logs)
        print_status "Showing WordPress logs..."
        docker-compose logs -f wordpress
        ;;

    reset)
        print_warning "This will stop and remove containers (but keeps your files)"
        read -p "Continue? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            docker-compose down
            print_success "Containers removed. Run './QUICK_START.sh start' to restart"
        fi
        ;;

    clean)
        print_warning "This will remove EVERYTHING including your database!"
        read -p "Type 'yes' to confirm: " confirm
        if [[ $confirm == "yes" ]]; then
            docker-compose down -v
            print_success "All containers and volumes removed"
        else
            print_status "Cancelled"
        fi
        ;;

    backup)
        print_status "Creating database backup..."
        BACKUP_FILE="wordpress_backup_$(date +%Y%m%d_%H%M%S).sql"
        docker-compose exec -T mysql mysqldump -u wordpress -pwordpress wordpress > "$BACKUP_FILE"
        print_success "Backup created: $BACKUP_FILE"
        ;;

    import)
        if [ -z "$2" ]; then
            print_status "Available backups:"
            ls -lh wordpress_backup_*.sql 2>/dev/null || echo "No backups found"
            echo ""
            print_status "Usage: ./QUICK_START.sh import wordpress_backup_YYYYMMDD_HHMMSS.sql"
        else
            if [ ! -f "$2" ]; then
                print_warning "File not found: $2"
                exit 1
            fi
            print_status "Importing database from $2..."
            docker-compose exec -T mysql mysql -u wordpress -pwordpress wordpress < "$2"
            print_success "Database imported"
        fi
        ;;

    status)
        print_status "Container status:"
        docker-compose ps
        ;;

    url)
        print_status "WordPress URLs:"
        echo "  Site: http://localhost:8000"
        echo "  Admin: http://localhost:8000/wp-admin"
        echo "  Database: localhost:3306"
        ;;

    help|--help|-h)
        show_help
        ;;

    *)
        print_warning "Unknown command: $1"
        show_help
        exit 1
        ;;
esac
