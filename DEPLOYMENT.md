# Deployment Guide: Local to Digital Ocean

This guide walks you through moving your WordPress portfolio site from local development to Digital Ocean.

## Prerequisites

- Digital Ocean account with billing configured
- Domain name registered (optional, can use DO subdomain initially)
- Local WordPress site complete and tested
- Git repository pushed to GitHub

## Step 1: Prepare Local Export

### Export WordPress Database

From your local machine, run:

```bash
# Access WordPress container
docker-compose exec mysql mysqldump -u wordpress -pwordpress wordpress > wordpress_backup.sql

# This creates a database backup file
```

### Export wp-content (themes, plugins, uploads)

```bash
# Backup wp-content directory
tar -czf wp-content.tar.gz wordpress/wp-content/
```

These files should be committed to git or stored separately for upload.

## Step 2: Create Digital Ocean WordPress Droplet

1. **Log into Digital Ocean** - go to digitalocean.com
2. **Create → Droplets**
3. **Choose Image:** Search for "WordPress" and select the latest version
4. **Choose Plan:** $5-6/month plan is sufficient for a portfolio site
5. **Choose Region:** Pick closest to your location
6. **Authentication:** Add your SSH key (recommended) or use password
7. **Create Droplet**
8. **Note the droplet's IP address** (you'll need this)

## Step 3: Connect to Your Droplet

```bash
# SSH into your droplet (replace IP_ADDRESS)
ssh root@IP_ADDRESS

# Or if using password auth, it'll prompt for password
```

## Step 4: Update and Prepare Server

Once connected to your droplet, run:

```bash
# Update system packages
apt update && apt upgrade -y

# Digital Ocean WordPress image includes most tools, but verify:
# - MySQL/MariaDB is running
# - WordPress is installed at /var/www/html
# - Nginx or Apache is configured

# Check WordPress directory
ls -la /var/www/html/

# Check if WordPress is already running
systemctl status mysql
systemctl status nginx
```

## Step 5: Database Migration

### Option A: Import Your Local Database (Recommended)

```bash
# From your local machine, copy backup to droplet
scp wordpress_backup.sql root@IP_ADDRESS:/tmp/

# SSH back into droplet
ssh root@IP_ADDRESS

# Connect to MySQL and import
mysql -u root -p
# Enter the root password (check DO email for credentials)

# In MySQL prompt:
DROP DATABASE wordpress;
CREATE DATABASE wordpress;
EXIT;

# Import your backup
mysql -u root -p wordpress < /tmp/wordpress_backup.sql
```

### Option B: Fresh Database with Content Export

If Option A has issues, Digital Ocean provides tools:

```bash
# Inside droplet, access WordPress CLI if installed
wp db import /path/to/backup.sql --allow-root
```

## Step 6: Upload Your wp-content

```bash
# From local machine, upload your custom content
scp wp-content.tar.gz root@IP_ADDRESS:/tmp/

# SSH into droplet
ssh root@IP_ADDRESS

# Backup existing wp-content
mv /var/www/html/wp-content /var/www/html/wp-content.backup

# Extract your content
cd /var/www/html
tar -xzf /tmp/wp-content.tar.gz

# Fix permissions
chown -R www-data:www-data /var/www/html/wp-content
chmod -R 755 /var/www/html/wp-content
```

## Step 7: Configure WordPress Settings

### Update wp-config.php

```bash
# SSH into droplet
ssh root@IP_ADDRESS

# Edit WordPress config (adjust DB credentials if needed)
nano /var/www/html/wp-config.php

# Ensure these are set correctly:
# define('DB_NAME', 'wordpress');
# define('DB_USER', 'wordpress');
# define('DB_PASSWORD', 'your-db-password');
# define('DB_HOST', 'localhost');

# Save: Ctrl+X, then Y, then Enter
```

### Update WordPress URLs

```bash
# SSH into droplet, access WordPress CLI
cd /var/www/html

# Update WordPress and home URLs (replace with your domain/IP)
wp option update siteurl "http://YOUR_DOMAIN_OR_IP" --allow-root
wp option update home "http://YOUR_DOMAIN_OR_IP" --allow-root

# Example: wp option update siteurl "http://landscape-portfolio.com"
```

## Step 8: Set Up Your Domain

### Option A: Using Digital Ocean DNS (Recommended)

1. In Digital Ocean console, go to Networking → Domains
2. Add your domain
3. Create DNS records pointing to your droplet IP:
   - Type: A
   - Hostname: @
   - Value: [Your droplet IP]

### Option B: Update External Domain Registrar

If your domain is registered elsewhere (GoDaddy, Namecheap, etc.):
1. Go to your registrar's DNS settings
2. Create A record: `@ -> [Your droplet IP]`
3. Create CNAME record: `www -> [Your domain]`
4. Wait for DNS to propagate (15 mins to 48 hours)

## Step 9: Enable HTTPS (SSL Certificate)

Digital Ocean WordPress image usually includes Let's Encrypt. Run:

```bash
# SSH into droplet
ssh root@IP_ADDRESS

# If using Certbot
sudo certbot certonly --webroot -w /var/www/html -d yourdomain.com -d www.yourdomain.com

# Follow prompts and note the certificate paths
```

## Step 10: Verify Everything Works

1. **Visit your site:** http://your-domain.com
2. **Check admin:** http://your-domain.com/wp-admin
3. **Test projects page:** Verify before/after sliders work
4. **Test blog:** Check that blog posts display
5. **Test forms:** Test contact form submission
6. **Mobile test:** View on phone/tablet

## Step 11: Backup and Maintenance

Set up regular backups:

```bash
# SSH into droplet

# Create backup script
nano /root/backup-wordpress.sh

# Paste this:
#!/bin/bash
BACKUP_DIR="/backups"
DATE=$(date +%Y%m%d_%H%M%S)
mkdir -p $BACKUP_DIR

# Backup database
mysqldump -u root -p --databases wordpress > $BACKUP_DIR/wordpress_$DATE.sql

# Backup wp-content
tar -czf $BACKUP_DIR/wp-content_$DATE.tar.gz /var/www/html/wp-content/

echo "Backup completed: $DATE"

# Make executable
chmod +x /root/backup-wordpress.sh

# Run weekly (edit with: crontab -e)
# Add line: 0 2 * * 0 /root/backup-wordpress.sh
```

## Troubleshooting

### Site shows "Unable to connect to database"
- Check MySQL is running: `systemctl status mysql`
- Verify credentials in wp-config.php
- Check database exists: `mysql -u root -p -e "SHOW DATABASES;"`

### WordPress admin is slow or admin pages won't load
- Check server resources: `free -h` (should have available RAM)
- Check MySQL processes: `mysql -u root -p -e "SHOW PROCESSLIST;"`
- Restart MySQL: `systemctl restart mysql`

### Images not loading
- Check permissions: `ls -la /var/www/html/wp-content/uploads/`
- Fix if needed: `chown -R www-data:www-data /var/www/html/wp-content/`

### SSL certificate won't renew
- Check renewal: `certbot renew --dry-run`
- Setup auto-renewal cron job if not present

## Performance Tips

1. **Enable caching plugin:** Install "WP Super Cache" free plugin
2. **Optimize images:** Use "Smush" plugin to auto-optimize uploads
3. **Monitor:** Set up Digital Ocean monitoring for CPU/memory
4. **Backups:** Run backups weekly (see backup script above)

## Final Checklist

- [ ] Database imported successfully
- [ ] Custom theme/plugins uploaded
- [ ] wp-config.php URLs updated
- [ ] Domain pointing to droplet
- [ ] SSL certificate installed
- [ ] All projects display correctly
- [ ] Before/after sliders work
- [ ] Blog posts visible
- [ ] Contact form functional
- [ ] Mobile site looks good
- [ ] Backups automated

## Support

- **WordPress Issues:** WordPress.org docs and forums
- **Digital Ocean Support:** DigitalOcean community forums and support tickets
- **Neve Theme Help:** Neve theme documentation site
- **SSL Issues:** Let's Encrypt documentation

---

**You're live!** Your landscape portfolio is now on Digital Ocean and accessible worldwide.
