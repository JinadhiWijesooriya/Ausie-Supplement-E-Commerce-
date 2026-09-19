# Ausie-Supplement-E-Commerce-

[![Next.js](https://img.shields.io/badge/Frontend-Next.js%2014-black?style=flat&logo=next.js)](https://nextjs.org/)
[![Django](https://img.shields.io/badge/Backend-Django%205.0%20%2B%20DRF-092E20?style=flat&logo=django)](https://www.djangoproject.com/)
[![TypeScript](https://img.shields.io/badge/Language-TypeScript-blue?style=flat&logo=typescript)](https://www.typescriptlang.org/)
[![Python](https://img.shields.io/badge/Language-Python%203.12-yellow?style=flat&logo=python)](https://www.python.org/)
[![Tailwind CSS](https://img.shields.io/badge/Styling-Tailwind%20CSS-38B2AC?style=flat&logo=tailwind-css)](https://tailwindcss.com/)

A premium, full-stack Australian supplements e-commerce platform engineered for both **B2C retail** customers and **B2B wholesale** clients. Built with an Australian Natural + Premium Wellness aesthetic, fast server-side rendering, and robust REST APIs.

---

## 🌿 Overview & Key Features

### 🛒 B2C Retail Experience
- **Australian Wellness Aesthetic**: Themed with deep eucalyptus greens, warm off-whites, and golden accents.
- **Product Catalog & Search**: Instant filtering by brand, health goal (Immunity, Muscle & Fitness, Gut Health, etc.), dietary needs (Vegan, Gluten-Free, Organic), and price range.
- **Verified Reviews & Photo Galleries**: Dynamic review system with verified buyer badges, rating breakdown, photo uploads, and helpful voting.
- **Interactive Health Tools**:
  - 3-Step **Supplement Finder Quiz** tailored to customer goals.
  - Side-by-side **Product Comparison Matrix**.
- **Australian Checkout Workflow**: Native support for Australian states, territories, and postcodes, GST calculations, courier options (Standard & Express), discount coupons, and payment gateway integration.

### 🏢 B2B Wholesale Portal
- **Wholesale Application Form**: Streamlined onboarding supporting Australian Business Numbers (ABN) and business classification checks.
- **Automated Tiered Volume Pricing**: Dynamic volume discounts (1–9, 10–49, 50+ units) applied automatically at checkout.
- **Quick-Order SKU Matrix**: Rapid bulk ordering interface designed for gyms, health clinics, and retail distributors.

---

## 🛠️ Technology Stack

### Frontend
- **Framework**: Next.js 14+ (App Router)
- **Language**: TypeScript
- **Styling**: Tailwind CSS, PostCSS, Lucide Icons
- **Animation**: Framer Motion
- **SEO**: Metadata API, dynamic `sitemap.xml`, `robots.txt`, and Google JSON-LD schema markup (`Product`, `Organization`, `AggregateRating`, `Review`).

### Backend
- **Framework**: Python 3.12, Django 5.0, Django REST Framework (DRF)
- **Authentication**: SimpleJWT (JSON Web Tokens) & Django Session Auth
- **Database**: PostgreSQL (Production) / SQLite3 (Development)
- **Modular Architecture**:
  - `accounts`: User profiles, B2B wholesale applications, addresses.
  - `products`, `categories`, `brands`: E-commerce catalog, ingredients, allergen info, tier pricing.
  - `cart` & `orders`: Cart management, checkout, GST calculation, order tracking.
  - `reviews`: Customer reviews, rating aggregations, verified purchases.
  - `coupons`: Discount code engine.
  - `blog`: Wellness articles, SEO content.

---

## 🚀 Getting Started Locally

### Prerequisites
- **Node.js**: v18 or v20+
- **Python**: v3.10, v3.11, or v3.12
- **Git**

---

### 1. Backend Setup (Django API)

1. Open your terminal and navigate to the `backend` directory:
   ```bash
   cd backend
   ```

2. Create and activate a Python virtual environment:
   ```bash
   # Windows
   python -m venv venv
   .\venv\Scripts\activate

   # macOS/Linux
   python3 -m venv venv
   source venv/bin/activate
   ```

3. Install backend dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Run migrations:
   ```bash
   python manage.py makemigrations accounts categories brands products reviews wholesale cart orders coupons blog analytics
   python manage.py migrate
   ```

5. (Optional) Seed sample products, categories, and reviews:
   ```bash
   python seed_data.py
   ```

6. Start the Django API server:
   ```bash
   python manage.py runserver 127.0.0.1:8000
   ```

- **API Endpoint**: `http://127.0.0.1:8000/api/`
- **Django Admin**: `http://127.0.0.1:8000/admin/`

---

### 2. Frontend Setup (Next.js)

1. Open a new terminal and navigate to the `frontend` directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Configure environment variables:
   Create a `.env.local` file inside `frontend/`:
   ```env
   NEXT_PUBLIC_API_URL=http://127.0.0.1:8000/api
   NEXT_PUBLIC_WHATSAPP_NUMBER=94775696254
   ```

4. Start the Next.js development server:
   ```bash
   npm run dev
   ```

5. Open your browser and visit:
   ```
   http://localhost:3000
   ```

---

## 📁 Repository Structure

```
Ausie-Supplement-E-Commerce-/
├── backend/
│   ├── accounts/          # Customer & wholesale account management
│   ├── analytics/         # Sales and traffic analytics
│   ├── blog/              # Health & supplement blog articles
│   ├── brands/            # Supplement brand management
│   ├── cart/              # Shopping cart & session handling
│   ├── categories/        # Product categories & health goals
│   ├── core/              # Django settings, URLs, WSGI configuration
│   ├── coupons/           # Promotional codes & discounts
│   ├── orders/            # Order processing, checkout, tracking
│   ├── products/          # Product catalog, variants, tiered pricing
│   ├── reviews/           # Verified reviews, ratings, photos
│   ├── wholesale/         # B2B pricing, wholesale approval workflows
│   ├── manage.py          # Django CLI
│   └── requirements.txt   # Python dependencies
├── frontend/
│   ├── src/
│   │   ├── app/           # Next.js App Router (pages & API routes)
│   │   ├── components/    # Reusable UI components
│   │   ├── lib/           # API clients, helpers, constants
│   │   └── types/         # TypeScript definitions
│   ├── package.json       # Frontend scripts and packages
│   └── tsconfig.json      # TypeScript configuration
└── README.md              # Project documentation
```

---

## 📄 License

This project is licensed under the MIT License.
