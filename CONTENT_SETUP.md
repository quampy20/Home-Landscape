# Content Setup Guide

Follow this guide to add your three landscape projects and blog content to your WordPress site.

## Before You Start

Gather these items for each project:
- [ ] 5-10 before/after image pairs (same location/angle)
- [ ] Project title and description
- [ ] Project dates (start/completion)
- [ ] Challenges faced and solutions
- [ ] Key takeaways/lessons learned
- [ ] Optional: cost estimates, materials list, timeline details

Image recommendations:
- **Format:** JPG or PNG
- **Size:** 1200x800px or larger (WordPress handles resizing)
- **Quality:** High quality, well-lit photos
- **Consistency:** Keep similar framing for before/after pairs

## Step 1: WordPress Login & Initial Setup

1. Open http://localhost:8000 in your browser
2. If first time, complete WordPress installation:
   - Site title: "Home Landscape Projects" (or your preference)
   - Username: Create a strong username
   - Password: Create a strong password
   - Email: jay@quampy.com
3. Log in with your credentials

## Step 2: Install Required Theme & Plugins

### Install Neve Theme

1. **Admin Dashboard → Appearance → Themes**
2. Click "Add New"
3. Search for "Neve"
4. Click "Install" then "Activate"

### Install Essential Plugins

1. **Admin Dashboard → Plugins → Add New**

Install these plugins (one at a time):

#### Plugin 1: Before/After Image Slider
- Search: "Before After Image Slider"
- By: WP Forge or similar
- Install and Activate

#### Plugin 2: Yoast SEO
- Search: "Yoast SEO"
- Install and Activate
- Complete setup wizard

#### Plugin 3: Contact Form
- Search: "Contact Form 7" OR "WPForms Lite"
- Install and Activate

#### Plugin 4: Image Optimization (Optional)
- Search: "Smush"
- Install and Activate
- This auto-optimizes uploaded images

## Step 3: Configure WordPress Settings

### Basic Settings

1. **Admin Dashboard → Settings → General**
   - Site Title: "Home Landscape Projects"
   - Tagline: "DIY Landscape Transformations"
   - Admin email: jay@quampy.com

2. **Admin Dashboard → Settings → Permalink**
   - Select: "Post name" 
   - This creates clean URLs like `/project-1/`

### Homepage Setup

1. **Admin Dashboard → Settings → Reading**
   - Under "Your homepage displays":
   - Select "A static page"
   - Homepage: Create new page called "Home"
   - Posts page: Create new page called "Blog"

## Step 4: Create Site Pages

Create these pages in order (Admin → Pages → Add New):

### Page 1: Home (Homepage)

**Title:** Home  
**Slug:** (leave as home)  
**Template:** Homepage or Default  
**Content:**

```
# Landscape Transformations

Welcome to my portfolio of DIY landscape remodels. 
Below are three complete home landscape projects 
showcasing design, planning, and execution.

[Add featured image or hero section]

[Featured Projects section - you'll customize this in Neve theme settings]
```

### Page 2: Projects

**Title:** Projects  
**Slug:** projects  
**Template:** Default  
**Content:**

```
# Landscape Projects

Three complete landscape remodel projects from start to finish.
Each project includes before/after galleries and detailed descriptions.
```

(Leave detailed content empty - you'll create individual project pages below)

### Page 3: Blog

**Title:** Blog  
**Slug:** blog  
**Template:** Blog or Archive  
**Content:** Leave mostly empty (will auto-populate with posts)

```
# DIY Landscape Blog

Tips, techniques, and lessons learned from my landscape projects.
```

### Page 4: Contact

**Title:** Contact  
**Slug:** contact  
**Template:** Default  
**Content:**

```
# Get In Touch

Have questions about these projects or need landscaping advice?
Feel free to reach out!

[Insert Contact Form 7 shortcode - see below]
```

#### Add Contact Form:
1. **Admin Dashboard → Contact → Contact Forms**
2. Click "Add New"
3. Title: "Contact Us"
4. Use default form or customize
5. Copy the shortcode: `[contact-form-7 id="xxx"]`
6. Paste into Contact page

### Page 5: About

**Title:** About  
**Slug:** about  
**Template:** Default  
**Content:**

```
# About These Projects

I'm sharing three landscape transformation projects 
that I've completed on my homes. Each project was a learning experience 
in design, planning, and execution.

**Why I built these gardens:**
- [Your reason 1]
- [Your reason 2]
- [Your reason 3]

**What I learned:**
- [Key learning 1]
- [Key learning 2]

**Next project:** [Optional - what's next?]
```

## Step 5: Create Individual Project Pages

Create three project pages (Admin → Pages → Add New):

### PROJECT 1 PAGE

**Title:** [Your Home 1 Name] - Landscape Remodel  
**Slug:** project-home-1  
**Featured Image:** Upload a beautiful finished photo

**Content Template:**

```
## Project Overview

**Location:** [Address or area]  
**Duration:** [Start date] to [End date]  
**Area:** [Square footage or garden size]  

## Before & After

[Add before/after image sliders here - see section below]

## Project Description

[Write 2-3 paragraphs describing the transformation]

### Challenges & Solutions

1. **Challenge:** [What was difficult?]
   **Solution:** [How did you solve it?]

2. **Challenge:** [Another issue]
   **Solution:** [Your approach]

3. **Challenge:** [Another issue]
   **Solution:** [Your approach]

### Key Takeaways

- **Lesson 1:** [What did you learn?]
- **Lesson 2:** [What did you learn?]
- **Lesson 3:** [What did you learn?]

### Materials & Plants Used

[Optional: List of materials, plants, costs]

### Timeline

- **Week 1:** [What you did]
- **Week 2:** [What you did]
- **Week 3:** [What you did]
- **Ongoing:** [Maintenance plans]
```

#### How to Add Before/After Sliders:

1. **Upload image pairs:**
   - Admin → Media → Add New
   - Upload first "before" image
   - Note the image URL
   - Upload corresponding "after" image
   - Note the image URL

2. **Add slider to page:**
   - In page editor, click "Add Block" or "Add Media"
   - Search for "Before After" block/shortcode
   - Insert shortcode like: 
   ```
   [ba-slider before_image_url="BEFORE_URL" 
              after_image_url="AFTER_URL"]
   ```
   - Or use the block's UI to select images

3. **Repeat for each image pair** (5-10 pairs per project)

### Repeat for PROJECT 2 and PROJECT 3

Use the same template, just with different:
- Title
- Slug: `project-home-2`, `project-home-3`
- Content and images
- Before/after image pairs

## Step 6: Create Blog Posts

Create sample blog posts (Admin → Posts → Add New):

### Blog Post 1: "10 Essential Landscape Design Tips"

**Title:** 10 Essential Landscape Design Tips  
**Slug:** landscape-design-tips  
**Category:** Tips (create if needed)  
**Featured Image:** Relevant landscape photo  

**Content:**
```
# 10 Essential Landscape Design Tips

When planning a landscape transformation, these principles
will guide your project from concept to completion.

## 1. Start with a Clear Vision

Before digging or planting, visualize what you want to achieve.
[Share your approach...]

## 2. Understand Your Soil

[Your insights...]

## 3. Choose Native Plants

[Your approach...]

[Continue with 7 more tips based on your experience]

## Conclusion

Apply these tips to your next landscape project!
```

### Blog Post 2: "DIY Landscaping Mistakes I Made (and How to Avoid Them)"

**Title:** DIY Landscaping Mistakes I Made (and How to Avoid Them)  
**Content:** Share specific mistakes from your projects

### Blog Post 3: "Timeline: Planning Your First Landscape Project"

**Title:** Timeline: Planning Your First Landscape Project  
**Content:** Step-by-step timeline from planning to completion

## Step 7: Customize Theme Appearance

1. **Admin Dashboard → Appearance → Customize**

2. **Configure:**
   - **Identity:** Logo, tagline, site icon
   - **Colors:** Pick a cohesive color scheme (earth tones work well for landscape)
   - **Typography:** Choose readable fonts
   - **Homepage Settings:** Configure featured projects carousel
   - **Header/Footer:** Customize navigation menus

3. **Create Navigation Menu:**
   - Admin → Appearance → Menus
   - Create menu: "Main Menu"
   - Add pages: Home, Projects, Blog, About, Contact
   - Set as "Display location: Primary Menu"

## Step 8: Test Everything

Before going live:

- [ ] Visit homepage - looks professional?
- [ ] Click through all pages - links work?
- [ ] View each project page - images load?
- [ ] Before/after sliders - smooth interaction?
- [ ] Blog posts - content visible and formatted?
- [ ] Contact form - can you submit it?
- [ ] Mobile view - looks good on phone?
- [ ] Images - loading quickly?

Test on actual mobile phone:
```bash
# Get your local IP (on Mac/Linux)
ifconfig | grep "inet "

# Then visit http://YOUR_IP:8000 from phone on same network
```

## Step 9: SEO Optimization (Yoast)

For each page and post:

1. **Admin → Page/Post → Edit**
2. Scroll to "Yoast SEO" section
3. Set "Focus Keyword" (e.g., "landscape remodel [home]")
4. Write meta description (160 chars)
5. Let Yoast guide you to "green light"

Example keywords:
- "DIY landscape remodel"
- "Before and after landscape transformation"
- "Home garden design [your location]"

## Ready to Deploy?

Once you've added all content and tested locally:

1. Commit changes to git
2. Push to GitHub
3. Follow DEPLOYMENT.md to move to Digital Ocean

## Helpful Tips

- **Save frequently** - WordPress auto-saves, but manually save too
- **Use drafts** - Write posts as drafts before publishing
- **Preview** - Always preview before publishing
- **Backups** - Regularly backup your WordPress (see README.md)
- **Images** - Keep originals; WordPress creates thumbnails automatically

## Troubleshooting Content

**Images not uploading?**
- Check browser console for errors
- Try a smaller image file
- Check file format (JPG, PNG recommended)

**Page slugs won't change?**
- Click "Edit" next to slug field
- Make sure permalink is set to "Post name" (Settings → Permalinks)

**Contact form not working?**
- Check form configuration
- Verify email settings (Settings → Discussion)
- Test with simple message first

**Blog posts not showing on Blog page?**
- Make sure posts are "Published" (not Draft)
- Check category assignments if filtered
- Verify "Posts page" is set in Settings → Reading

---

**Questions?** Refer to WordPress.org documentation or the Neve theme docs.
