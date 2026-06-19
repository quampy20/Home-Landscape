# Home Landscape Portfolio

A beautiful WordPress portfolio site showcasing DIY landscape remodel projects for three homes with before and after galleries.

## Project Overview

This site features three landscape transformation projects with:
- Interactive before/after image sliders
- Detailed project pages with timelines
- DIY blog with landscaping tips and lessons learned
- Modern, fast-loading design optimized for mobile
- SEO-ready structure

## Local Development Setup

### Prerequisites
- Docker & Docker Compose installed
- Git

### Quick Start

1. **Clone and navigate to the project:**
   ```bash
   cd Home-Landscape
   ```

2. **Start the local WordPress site:**
   ```bash
   docker-compose up -d
   ```

3. **Wait for services to start (~30 seconds), then visit:**
   - **WordPress:** http://localhost:8000
   - **Admin:** http://localhost:8000/wp-admin
   - Initial login: `admin` / `admin` (set this up on first run)

4. **Stop when done:**
   ```bash
   docker-compose down
   ```

### First-Time Setup

1. Access http://localhost:8000 and complete the WordPress installation
2. Install the Neve theme from Themes menu
3. Install required plugins:
   - Before/After Image Slider
   - Yoast SEO (free version)
   - WPForms Lite (or Contact Form 7)

## Project Structure

```
Home-Landscape/
├── docker-compose.yml          # Local dev environment
├── README.md                   # This file
├── wordpress/                  # WordPress installation (created by Docker)
│   ├── wp-config.php
│   ├── wp-content/
│   │   ├── themes/
│   │   ├── plugins/
│   │   └── uploads/            # Project images go here
│   └── [other WP files]
└── DEPLOYMENT.md               # Digital Ocean migration guide
```

## Site Structure & Content Plan

### Home Page
- Hero section: Large landscape transformation image
- Brief introduction to your DIY journey
- Featured projects carousel
- Call-to-action to view all projects

### Projects Page
Grid layout with 3 project cards:

#### Project 1
- **Title:** [Home 1 Name]
- **Location/Address**
- **Timeline:** [Dates]
- Before/After Slider Gallery (5-8 image pairs)
- Project description & challenges
- Tips & lessons learned

#### Project 2
- **Title:** [Home 2 Name]
- Same structure as Project 1

#### Project 3
- **Title:** [Home 3 Name]
- Same structure as Project 1

### Blog Section
- DIY landscaping tips
- Process posts from your projects
- Lessons learned
- Materials/tool recommendations

### Contact Page
- Contact form for inquiries
- Social media links

## Adding Content

### Adding Project Images

1. Go to WordPress Admin → Media → Add New
2. Upload before/after image pairs
3. Keep consistent naming: `project1-area-before.jpg`, `project1-area-after.jpg`

### Creating a Project Page

1. Admin → Pages → Add New
2. Use the "Project" page template
3. Add project details in custom fields
4. Use Before/After Image Slider block to add image pairs
5. Publish

### Writing Blog Posts

1. Admin → Posts → Add New
2. Add featured image
3. Write content in markdown-friendly editor
4. Add category/tags
5. Publish

## Theme & Customization

- **Theme:** Neve (lightweight, fast, portfolio-ready)
- **Colors:** Customizable via WordPress Customizer
- **Typography:** Modern, readable fonts pre-configured

To customize:
1. Admin → Appearance → Customize
2. Modify colors, fonts, homepage layout
3. Changes save automatically

## SEO Setup

1. Install Yoast SEO plugin
2. For each project page:
   - Set focus keyword (e.g., "landscape remodel [location]")
   - Add meta description
   - Add focus keyword to page title
3. For blog posts:
   - Set relevant keywords
   - Write compelling meta descriptions

## Migration to Digital Ocean

See `DEPLOYMENT.md` for complete step-by-step guide to move from local to production on Digital Ocean.

**TL;DR:**
1. Export database from local
2. Push repo to GitHub
3. Create Digital Ocean WordPress droplet
4. Import database export
5. Configure domain & SSL

## Troubleshooting

### WordPress won't start
```bash
docker-compose logs wordpress
docker-compose down
docker-compose up -d
```

### Database connection issues
```bash
docker-compose down -v  # Remove volumes
docker-compose up -d    # Restart with fresh DB
```

### Permission issues with file uploads
```bash
chmod -R 755 wordpress/wp-content/uploads
```

## Browser Testing

- Test on Chrome, Firefox, Safari
- Mobile responsiveness: test on phone browser
- Before/After sliders: verify smooth interaction
- Gallery loading: ensure images load quickly

## Next Steps

1. Gather all before/after images for the 3 projects
2. Write project descriptions and timelines
3. Customise colors/fonts in WordPress Customizer
4. Add 5-10 blog posts with landscaping tips
5. Review and test all pages locally
6. When ready, follow DEPLOYMENT.md to push to Digital Ocean

## Support

For WordPress help: [WordPress.org Documentation](https://wordpress.org/support/)
For Neve theme: [Neve Documentation](https://docs.themeisle.com/article/946-neve-documentation)
