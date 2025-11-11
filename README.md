# FacturaScripts REST API Documentation

Complete documentation for the FacturaScripts REST API v3, including both human-readable Markdown documentation and machine-readable OpenAPI/Swagger specification.

## 📁 Files

- **`facturascripts-api-documentation.md`** - Comprehensive Markdown documentation with detailed descriptions, examples, and use cases
- **`facturascripts-api-openapi.yaml`** - OpenAPI 3.0 specification for API tooling and automated testing

## 🚀 Quick Start

### API Instance

- **Base URL**: `http://192.168.113.1:8899/api/3`
- **Authentication**: Token-based (header: `Token: YOUR_TOKEN`)
- **Format**: JSON

### Example Request

```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/clientes
```

## 📚 Using the Documentation

### 1. Markdown Documentation

The `facturascripts-api-documentation.md` file provides:

- Complete endpoint listing (142 endpoints)
- Detailed schema information for major resources
- Authentication instructions
- Request/response examples
- Best practices
- Common error handling patterns

**Best for**: 
- Learning the API
- Implementation reference
- Onboarding new developers

### 2. OpenAPI Specification

The `facturascripts-api-openapi.yaml` file can be used with:

#### Swagger UI (Interactive Documentation)

View and test the API interactively:

```bash
# Using Docker
docker run -p 8080:8080 \
  -e SWAGGER_JSON=/api/facturascripts-api-openapi.yaml \
  -v $(pwd):/api \
  swaggerapi/swagger-ui

# Open: http://localhost:8080
```

#### Swagger Editor

Edit and validate the specification:

```bash
docker run -p 8081:8080 swaggerapi/swagger-editor
# Open: http://localhost:8081
# Import the YAML file
```

#### Postman

1. Open Postman
2. Click **Import**
3. Select `facturascripts-api-openapi.yaml`
4. Set up environment variable `Token` = `YOUR_TOKEN`

#### Insomnia

1. Open Insomnia
2. Click **Create** → **Import From** → **File**
3. Select `facturascripts-api-openapi.yaml`
4. Configure Token header in settings

#### Code Generation

Generate client libraries using OpenAPI Generator:

```bash
# JavaScript/TypeScript
npx @openapitools/openapi-generator-cli generate \
  -i facturascripts-api-openapi.yaml \
  -g typescript-axios \
  -o ./client

# Python
npx @openapitools/openapi-generator-cli generate \
  -i facturascripts-api-openapi.yaml \
  -g python \
  -o ./client

# PHP
npx @openapitools/openapi-generator-cli generate \
  -i facturascripts-api-openapi.yaml \
  -g php \
  -o ./client
```

## 🎯 Key Features

### 142 Available Endpoints

The API provides comprehensive access to:

- **Master Data**: Countries, cities, provinces, postal codes
- **Customer & Supplier Management**: Complete CRM functionality
- **Product Catalog**: Products, families, variants, stock management
- **Sales Documents**: Invoices, orders, quotations, delivery notes
- **Purchase Documents**: Supplier invoices, orders, and documents
- **Accounting**: Journal entries, chart of accounts, fiscal years
- **Configuration**: Companies, payment methods, taxes, currencies
- **Administration**: Users, roles, API keys, system settings

### Schema Discovery

Every resource provides schema information:

```bash
# Get field definitions for any resource
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/{resource}/schema
```

### RESTful Operations

Standard CRUD operations on all resources:

- `GET /api/3/{resource}` - List all
- `GET /api/3/{resource}/{id}` - Get one
- `POST /api/3/{resource}` - Create
- `PUT /api/3/{resource}/{id}` - Update
- `DELETE /api/3/{resource}/{id}` - Delete

## 📖 Common Use Cases

### 1. List All Customers

```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/clientes
```

### 2. Create a New Product

```bash
curl -X POST \
  -H "Token: YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "referencia": "PROD001",
    "descripcion": "Example Product",
    "precio": 19.99,
    "sevende": 1,
    "secompra": 1
  }' \
  http://192.168.113.1:8899/api/3/productos
```

### 3. Get Customer Invoice Details

```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/facturaclientes/12345
```

### 4. Update Customer Information

```bash
curl -X PUT \
  -H "Token: YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "newemail@example.com",
    "telefono1": "600999888"
  }' \
  http://192.168.113.1:8899/api/3/clientes/CLI001
```

### 5. Get Product Family Schema

```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/familias/schema
```

## 🔒 Authentication

### Getting an API Key

1. Log into FacturaScripts admin panel
2. Navigate to **Administrador** → **Panel de control**
3. Enable **Activar API** in the "Por defecto" section
4. Go to **API Keys** section
5. Click **Nuevo** to create a new key
6. Enable **Acceso completo** (full access)
7. Copy your API key

### Using the Token

Include the token in every request:

```http
Token: YOUR_TOKEN
```

Example with curl:

```bash
curl -H "Token: YOUR_TOKEN_HERE" \
  http://192.168.113.1:8899/api/3/endpoint
```

## 🛠️ Tools & Integration

### VS Code Extension

Install REST Client extension for testing:

```
ext install humao.rest-client
```

Create a `.http` file:

```http
@baseUrl = http://192.168.113.1:8899/api/3
@token = YOUR_TOKEN

### List Customers
GET {{baseUrl}}/clientes
Token: {{token}}

### Get Customer Schema
GET {{baseUrl}}/clientes/schema
Token: {{token}}
```

### Node.js Example

```javascript
const axios = require('axios');

const api = axios.create({
  baseURL: 'http://192.168.113.1:8899/api/3',
  headers: {
    'Token': 'YOUR_TOKEN'
  }
});

// List customers
api.get('/clientes')
  .then(response => console.log(response.data))
  .catch(error => console.error(error));

// Create product
api.post('/productos', {
  referencia: 'PROD001',
  descripcion: 'New Product',
  precio: 29.99
})
  .then(response => console.log(response.data))
  .catch(error => console.error(error));
```

### Python Example

```python
import requests

BASE_URL = 'http://192.168.113.1:8899/api/3'
TOKEN = 'YOUR_TOKEN'

headers = {
    'Token': TOKEN,
    'Content-Type': 'application/json'
}

# List customers
response = requests.get(f'{BASE_URL}/clientes', headers=headers)
customers = response.json()
print(customers)

# Create product
product_data = {
    'referencia': 'PROD001',
    'descripcion': 'New Product',
    'precio': 29.99
}
response = requests.post(f'{BASE_URL}/productos', 
                        json=product_data, 
                        headers=headers)
print(response.json())
```

### PHP Example

```php
<?php
$baseUrl = 'http://192.168.113.1:8899/api/3';
$token = 'YOUR_TOKEN';

$headers = [
    'Token: ' . $token,
    'Content-Type: application/json'
];

// List customers
$ch = curl_init($baseUrl . '/clientes');
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
$customers = json_decode($response, true);
curl_close($ch);

print_r($customers);
?>
```

## 🔍 Validation & Testing

### Validate OpenAPI Spec

```bash
# Using NPM
npx @apidevtools/swagger-cli validate facturascripts-api-openapi.yaml

# Using Docker
docker run --rm -v $(pwd):/spec \
  openapitools/openapi-generator-cli validate \
  -i /spec/facturascripts-api-openapi.yaml
```

### Test Endpoints

Use the provided examples in the Markdown documentation or import the OpenAPI spec into your testing tool.

## 📦 Resource Categories

### Core Business Entities

- **Customers**: `clientes`, `contactos`, `grupoclientes`
- **Suppliers**: `proveedores`, `productoproveedores`
- **Products**: `productos`, `familias`, `variantes`, `fabricantes`
- **Stock**: `stocks`, `almacenes`

### Sales Cycle

- **Quotations**: `presupuestoclientes`, `lineapresupuestoclientes`
- **Orders**: `pedidoclientes`, `lineapedidoclientes`
- **Delivery Notes**: `albaranclientes`, `lineaalbaranclientes`
- **Invoices**: `facturaclientes`, `lineafacturaclientes`
- **Payments**: `reciboclientes`, `pagoclientes`

### Purchase Cycle

- **Quotations**: `presupuestoproveedores`, `lineapresupuestoproveedores`
- **Orders**: `pedidoproveedores`, `lineapedidoproveedores`
- **Delivery Notes**: `albaranproveedores`, `lineaalbaranproveedores`
- **Invoices**: `facturaproveedores`, `lineafacturaproveedores`
- **Payments**: `reciboproveedores`, `pagoproveedores`

### Accounting

- **Entries**: `asientos`, `partidas`
- **Chart of Accounts**: `cuentas`, `subcuentas`
- **Fiscal**: `ejercicios`, `diarios`, `codemodeles`

### Configuration

- **Company**: `empresas`, `series`, `formapagos`
- **Geography**: `pais`, `provincias`, `ciudades`, `codigopostales`
- **Taxes**: `impuestos`, `retenciones`, `impuestozonas`
- **Banking**: `cuentabancos`, `cuentabancoclientes`, `cuentabancoproveedores`

## 🐛 Common Issues

### API-VERSION-NOT-FOUND Error

Make sure to include `/api/3` in the URL:

```bash
# ❌ Wrong
http://192.168.113.1:8899/api/clientes

# ✅ Correct
http://192.168.113.1:8899/api/3/clientes
```

### UNAUTHORIZED Error

Check that your Token header is correctly formatted:

```bash
# Include Token header
curl -H "Token: YOUR_TOKEN" ...
```

### Empty Response

Some endpoints may return an empty array `[]` if no data exists. Use the schema endpoint to understand required fields for creation.

## 📝 Contributing

To update this documentation:

1. Update the Markdown file for human-readable changes
2. Update the OpenAPI YAML for API specification changes
3. Validate the OpenAPI spec after changes
4. Test examples to ensure they work

## 🔗 Resources

- **Official Documentation**: https://facturascripts.com/publicaciones/la-api-rest-de-facturascripts-912
- **FacturaScripts Website**: https://facturascripts.com/
- **GitHub Repository**: https://github.com/NeoRazorX/facturascripts
- **Community Discord**: https://discord.gg/qKm7j9AaJT
- **OpenAPI Specification**: https://swagger.io/specification/

## 📄 License

This documentation is provided as-is for use with FacturaScripts. FacturaScripts itself is licensed under LGPL-3.0.

---

**Generated**: November 10, 2025  
**API Version**: 3  
**Instance**: http://192.168.113.1:8899
