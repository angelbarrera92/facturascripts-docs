# FacturaScripts API - Quick Reference

A condensed reference guide for the most commonly used FacturaScripts REST API endpoints.

## 🔐 Authentication

```bash
# All requests require this header
Token: YOUR_TOKEN
```

## 🌐 Base URL

```
http://192.168.113.1:8899/api/3
```

## 📋 Quick Commands

### Get Resource List
```bash
curl -H "Token: YOUR_TOKEN" http://192.168.113.1:8899/api/3
```

### Get Schema for Any Resource
```bash
curl -H "Token: YOUR_TOKEN" http://192.168.113.1:8899/api/3/{resource}/schema
```

---

## 👥 Customers (`/clientes`)

### List Customers
```bash
GET /api/3/clientes
```

### Get Customer
```bash
GET /api/3/clientes/{codcliente}
```

### Create Customer
```bash
POST /api/3/clientes
Content-Type: application/json

{
  "codcliente": "CLI001",
  "nombre": "Customer Name",
  "cifnif": "12345678A",
  "email": "customer@example.com",
  "telefono1": "600123456"
}
```

### Update Customer
```bash
PUT /api/3/clientes/{codcliente}
Content-Type: application/json

{
  "email": "newemail@example.com"
}
```

---

## 📦 Products (`/productos`)

### List Products
```bash
GET /api/3/productos
```

### Get Product
```bash
GET /api/3/productos/{idproducto}
```

### Create Product
```bash
POST /api/3/productos
Content-Type: application/json

{
  "referencia": "PROD001",
  "descripcion": "Product Description",
  "precio": 19.99,
  "sevende": 1,
  "secompra": 1,
  "codfamilia": "FAM01"
}
```

---

## 🏷️ Product Families (`/familias`)

### List Families
```bash
GET /api/3/familias
```

### Create Family
```bash
POST /api/3/familias
Content-Type: application/json

{
  "codfamilia": "FAM001",
  "descripcion": "Family Name"
}
```

---

## 🧾 Customer Invoices (`/facturaclientes`)

### List Invoices
```bash
GET /api/3/facturaclientes
```

### Get Invoice
```bash
GET /api/3/facturaclientes/{idfactura}
```

### Get Invoice Lines
```bash
GET /api/3/lineafacturaclientes
```

### Pay Invoice
```bash
POST /api/3/pagarFacturaCliente
Content-Type: application/json

{
  "idfactura": 123
}
```

---

## 🚚 Suppliers (`/proveedores`)

### List Suppliers
```bash
GET /api/3/proveedores
```

### List Supplier Invoices
```bash
GET /api/3/facturaproveedores
```

---

## 🏢 Company (`/empresas`)

### Get Company Info
```bash
GET /api/3/empresas
```

**Response Example:**
```json
[{
  "idempresa": 1,
  "nombre": "Company Name",
  "cifnif": "12345678A",
  "email": "info@company.com",
  "telefono1": "600123456",
  "direccion": "Company Address",
  "ciudad": "City",
  "codpostal": "12345"
}]
```

---

## 💰 Payment Methods (`/formapagos`)

### List Payment Methods
```bash
GET /api/3/formapagos
```

---

## 💵 Taxes (`/impuestos`)

### List Taxes
```bash
GET /api/3/impuestos
```

### Get Tax Schema
```bash
GET /api/3/impuestos/schema
```

---

## 📊 Accounting

### List Accounting Entries
```bash
GET /api/3/asientos
```

### List Chart of Accounts
```bash
GET /api/3/cuentas
```

### List Sub-accounts
```bash
GET /api/3/subcuentas
```

### List Fiscal Years
```bash
GET /api/3/ejercicios
```

---

## 📍 Geography

### Countries
```bash
GET /api/3/pais
```

### Provinces
```bash
GET /api/3/provincias
```

### Cities
```bash
GET /api/3/ciudades
```

### Postal Codes
```bash
GET /api/3/codigopostales
```

---

## 📑 Document Operations

### Create Customer Delivery Note
```bash
POST /api/3/crearAlbaranCliente
```

### Create Customer Invoice
```bash
POST /api/3/crearFacturaCliente
```

### Create Customer Order
```bash
POST /api/3/crearPedidoCliente
```

### Create Customer Quotation
```bash
POST /api/3/crearPresupuestoCliente
```

### Export Customer Invoice
```bash
POST /api/3/exportarFacturaCliente
```

---

## 🔧 Administration

### List Users
```bash
GET /api/3/users
```

### List Roles
```bash
GET /api/3/roles
```

### List API Keys
```bash
GET /api/3/apikeyes
```

### List Settings
```bash
GET /api/3/settings
```

### View Logs
```bash
GET /api/3/logmessages
```

---

## 📦 Inventory

### List Warehouses
```bash
GET /api/3/almacenes
```

### List Stock
```bash
GET /api/3/stocks
```

### List Product Variants
```bash
GET /api/3/variantes
```

---

## 💳 Banking

### Company Bank Accounts
```bash
GET /api/3/cuentabancos
```

### Customer Bank Accounts
```bash
GET /api/3/cuentabancoclientes
```

### Supplier Bank Accounts
```bash
GET /api/3/cuentabancoproveedores
```

---

## 🎯 Most Used Endpoints (Top 20)

1. `/clientes` - Customers
2. `/productos` - Products
3. `/facturaclientes` - Customer Invoices
4. `/familias` - Product Families
5. `/proveedores` - Suppliers
6. `/stocks` - Inventory Stock
7. `/albaranclientes` - Customer Delivery Notes
8. `/pedidoclientes` - Customer Orders
9. `/presupuestoclientes` - Customer Quotations
10. `/empresas` - Company Information
11. `/formapagos` - Payment Methods
12. `/impuestos` - Taxes
13. `/almacenes` - Warehouses
14. `/agentes` - Sales Agents
15. `/contactos` - Contacts
16. `/asientos` - Accounting Entries
17. `/cuentas` - Chart of Accounts
18. `/series` - Document Series
19. `/divisas` - Currencies
20. `/ejercicios` - Fiscal Years

---

## 🎨 Response Formats

### List Response
```json
[
  { "field1": "value1", "field2": "value2" },
  { "field1": "value3", "field2": "value4" }
]
```

### Schema Response
```json
{
  "fieldname": {
    "type": "varchar(10)",
    "default": null,
    "is_nullable": "NO"
  }
}
```

### Error Response
```json
{
  "error": "ERROR_CODE",
  "message": "Error description"
}
```

---

## ⚡ HTTP Methods

| Method | Action | Example |
|--------|--------|---------|
| GET | Retrieve resource(s) | `GET /api/3/clientes` |
| POST | Create new resource | `POST /api/3/clientes` |
| PUT | Update existing resource | `PUT /api/3/clientes/CLI001` |
| DELETE | Delete resource | `DELETE /api/3/clientes/CLI001` |

---

## 🔍 Common Patterns

### Pagination (if supported)
```bash
GET /api/3/clientes?page=1&limit=50
```

### Filtering (if supported)
```bash
GET /api/3/clientes?codgrupo=VIP
```

### Sorting (if supported)
```bash
GET /api/3/productos?sort=precio&order=desc
```

*Note: Check specific endpoint documentation for supported query parameters*

---

## 🚨 HTTP Status Codes

| Code | Meaning | Description |
|------|---------|-------------|
| 200 | OK | Success |
| 201 | Created | Resource created successfully |
| 400 | Bad Request | Invalid parameters |
| 401 | Unauthorized | Missing/invalid token |
| 404 | Not Found | Resource not found |
| 500 | Server Error | Internal error |

---

## 🛠️ Testing Tools

### cURL (Command Line)
```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/clientes
```

### HTTPie (Command Line)
```bash
http http://192.168.113.1:8899/api/3/clientes \
  Token:YOUR_TOKEN
```

### Postman
Import the OpenAPI spec: `facturascripts-api-openapi.yaml`

### Insomnia
Import the OpenAPI spec: `facturascripts-api-openapi.yaml`

---

## 📚 Full Documentation

For complete documentation, see:
- **Markdown**: `facturascripts-api-documentation.md`
- **OpenAPI**: `facturascripts-api-openapi.yaml`
- **Setup Guide**: `README-API.md`

---

**Last Updated**: November 10, 2025  
**API Version**: 3
