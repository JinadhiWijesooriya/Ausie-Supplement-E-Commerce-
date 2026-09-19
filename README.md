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

## 🐳 Docker Deployment

The platform includes a complete, production-grade Docker configuration with PostgreSQL, Redis, Django (Gunicorn + WhiteNoise), Next.js (Standalone Multi-Stage Runner), and Nginx reverse proxy.

### 1. Quick Start with Docker Compose

```bash
docker compose up --build -d
```

### 2. Services & Port Mapping

| Service | Technology | Port | Description |
|---|---|---|---|
| **Nginx Gateway** | Nginx 1.25 Alpine | `80` | Unified gateway routing `/` to Frontend and `/api/`, `/admin/` to Backend |
| **Frontend** | Next.js 14 (Standalone) | `3000` | E-commerce web storefront |
| **Backend** | Django 5 + Gunicorn | `8000` | REST API and Django Administration portal |
| **Database** | PostgreSQL 16 Alpine | `5432` | Relational database with automated healthchecks |
| **Cache & Broker** | Redis 7 Alpine | `6379` | In-memory caching and message broker |

### 3. Management Commands in Docker

* **Run Migrations:**
  ```bash
  docker compose exec backend python manage.py migrate
  ```
* **Seed Initial Data:**
  ```bash
  docker compose exec backend python seed_data.py
  ```
* **Create Superuser:**
  ```bash
  docker compose exec backend python manage.py createsuperuser
  ```
* **View Logs:**
  ```bash
  docker compose logs -f backend
  docker compose logs -f frontend
  ```
* **Stop Containers:**
  ```bash
  docker compose down
  ```

---

## 📁 Repository Structure

```
Ausie-Supplement-E-Commerce-/
├── backend/
│   ├── apps/              # Django modular applications (accounts, products, cart, etc.)
│   ├── config/            # Django settings, URLs, WSGI, ASGI
│   ├── Dockerfile         # Python 3.12-slim production container
│   ├── entrypoint.sh      # DB connection check & migration runner
│   ├── .dockerignore      # Ignored patterns for Docker context
│   ├── manage.py          # Django CLI
│   └── requirements.txt   # Python dependencies
├── frontend/
│   ├── app/               # Next.js App Router (pages & layout)
│   ├── components/        # UI components (Header, ProductCard, Quiz, etc.)
│   ├── lib/               # API clients, TypeScript types, and utilities
│   ├── public/            # Static images and assets
│   ├── Dockerfile         # Multi-stage optimized standalone container
│   ├── .dockerignore      # Ignored patterns for Docker context
│   ├── next.config.ts     # Next.js configuration (standalone output)
│   └── package.json       # Dependencies and build scripts
├── .github/
│   └── workflows/
│       └── ci-cd.yml      # GitHub Actions CI/CD Pipeline
├── nginx/
│   └── nginx.conf         # Unified reverse proxy routing
├── docker-compose.yml     # Multi-container orchestration
├── .env.example           # Environment configuration template
└── README.md              # Project documentation
```

---

## 🚀 CI/CD Pipeline (GitHub Actions)

This repository includes a production-grade automated CI/CD pipeline located in `.github/workflows/ci-cd.yml`:

- **Automated Quality Checks**:
  - **Frontend**: Dependency installation (`npm ci`), TypeScript strict type-checking (`npx tsc --noEmit`), and production compilation (`next build`).
  - **Backend**: Python dependencies installation, Django system sanity checks (`manage.py check`), uncommitted migration detection (`makemigrations --check`), and automated test suite run (`manage.py test`).
- **Container Delivery**:
  - Automatically triggered upon successful completion of CI jobs when code is merged or pushed to `main`.
  - Multi-platform image builds using Docker Buildx and GitHub Actions layer caching (`type=gha`).
  - Publishes tagged images to Docker Hub (`:latest` and `:<commit-sha>`).

### Required GitHub Secrets

To activate automatic publishing to Docker Hub, configure the following secrets in GitHub (**Settings > Secrets and variables > Actions**):

- `DOCKERHUB_USERNAME`: Your Docker Hub account username.
- `DOCKERHUB_TOKEN`: Personal Access Token created in Docker Hub (with Read/Write access).

---

## 📄 License

This project is licensed under the MIT License.

