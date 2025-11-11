# FacturaScripts REST API Documentation

## Overview

FacturaScripts REST API provides a simple way for developers to access, create, modify, and delete data from external applications. This API follows RESTful principles and returns responses in JSON format.

**Base URL:** `http://192.168.113.1:8899/api/3`

**API Version:** 3

**Upstream Documentation:** https://facturascripts.com/publicaciones/la-api-rest-de-facturascripts-912

---

## Table of Contents

- [Authentication](#authentication)
- [Common Patterns](#common-patterns)
- [Error Handling](#error-handling)
- [Rate Limiting](#rate-limiting)
- [Endpoints](#endpoints)
  - [Master Data](#master-data)
  - [Customers & Suppliers](#customers--suppliers)
  - [Products & Inventory](#products--inventory)
  - [Sales Documents](#sales-documents)
  - [Purchase Documents](#purchase-documents)
  - [Accounting](#accounting)
  - [System & Configuration](#system--configuration)
- [Schemas](#schemas)

---

## Authentication

The API uses token-based authentication. All requests must include a `Token` header with your API key.

### Activation Steps

1. Navigate to **Administrador > Panel de control**
2. Enable **Activar API** in the "Por defecto" section
3. Go to **API Keys** section
4. Click **Nuevo** to create a new API key
5. Enable **Acceso completo** (full access)

### Authentication Header

```http
Token: YOUR_TOKEN
```

### Example Request

```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/clientes
```

---

## Common Patterns

### List Resources

Get a list of all resources of a specific type:

```http
GET /api/3/{resource}
```

**Example:**
```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/clientes
```

### Get Resource Schema

Get the database schema for a specific resource:

```http
GET /api/3/{resource}/schema
```

**Example:**
```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/familias/schema
```

### Get Single Resource

Get details of a specific resource by ID:

```http
GET /api/3/{resource}/{id}
```

### Create Resource

Create a new resource:

```http
POST /api/3/{resource}
Content-Type: application/json

{
  "field1": "value1",
  "field2": "value2"
}
```

### Update Resource

Update an existing resource:

```http
PUT /api/3/{resource}/{id}
Content-Type: application/json

{
  "field1": "updated_value1"
}
```

### Delete Resource

Delete a resource:

```http
DELETE /api/3/{resource}/{id}
```

---

## Error Handling

### Common HTTP Status Codes

| Status Code | Description |
|------------|-------------|
| 200 OK | Successful GET, PUT, or DELETE request |
| 201 Created | Successful POST request |
| 400 Bad Request | Invalid request parameters or body |
| 401 Unauthorized | Missing or invalid API token |
| 404 Not Found | Resource not found |
| 500 Internal Server Error | Server error |

### Error Response Format

```json
{
  "error": "ERROR_CODE",
  "message": "Human-readable error message"
}
```

### Common Errors

- **API-VERSION-NOT-FOUND**: Invalid API version in URL (use `/api/3`)
- **UNAUTHORIZED**: Missing or invalid Token header
- **RESOURCE_NOT_FOUND**: Requested resource does not exist

---

## Rate Limiting

*Note: Rate limiting details should be confirmed with the API administrator.*

---

## Endpoints

### Master Data

#### Countries (`pais`)

Manage country information.

**List Countries**
```bash
GET /api/3/pais
```

**Get Country Schema**
```bash
GET /api/3/pais/schema
```

**Get Single Country**
```bash
GET /api/3/pais/{codpais}
```

---

#### Provinces (`provincias`)

Manage province/state information.

**List Provinces**
```bash
GET /api/3/provincias
```

---

#### Cities (`ciudades`)

Manage city information.

**List Cities**
```bash
GET /api/3/ciudades
```

---

#### Postal Codes (`codigopostales`)

Manage postal code information.

**List Postal Codes**
```bash
GET /api/3/codigopostales
```

---

#### Tax Identifiers (`identificadorfiscales`)

Manage fiscal identification types.

**List Tax Identifiers**
```bash
GET /api/3/identificadorfiscales
```

---

### Customers & Suppliers

#### Customers (`clientes`)

Manage customer information.

**Schema Fields:**
- `codcliente` (varchar(10), required) - Customer code
- `nombre` (varchar(100), required) - Customer name
- `cifnif` (varchar(30), required) - Tax ID number
- `email` (varchar(100)) - Email address
- `telefono1` (varchar(30)) - Primary phone
- `telefono2` (varchar(30)) - Secondary phone
- `razonsocial` (varchar(100)) - Business name
- `personafisica` (tinyint(1)) - Is individual (1) or company (0)
- `codagente` (varchar(10)) - Agent code
- `codgrupo` (varchar(6)) - Customer group
- `codpago` (varchar(10)) - Payment method
- `codserie` (varchar(4)) - Document series
- `regimeniva` (varchar(20)) - VAT regime
- `riesgomax` (double) - Maximum credit risk
- `riesgoalcanzado` (double) - Current credit used
- `fechaalta` (date) - Registration date
- `debaja` (tinyint(1)) - Is inactive
- `observaciones` (text) - Notes

**List Customers**
```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/clientes
```

**Get Customer Schema**
```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/clientes/schema
```

**Create Customer**
```bash
curl -X POST \
  -H "Token: YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "codcliente": "CLI001",
    "nombre": "Juan Pérez",
    "cifnif": "12345678A",
    "email": "juan@example.com",
    "telefono1": "600123456"
  }' \
  http://192.168.113.1:8899/api/3/clientes
```

---

#### Suppliers (`proveedores`)

Manage supplier information.

**List Suppliers**
```bash
GET /api/3/proveedores
```

**Get Supplier Schema**
```bash
GET /api/3/proveedores/schema
```

---

#### Contacts (`contactos`)

Manage contact information for customers and suppliers.

**List Contacts**
```bash
GET /api/3/contactos
```

---

#### Customer Groups (`grupoclientes`)

Manage customer grouping and segmentation.

**List Customer Groups**
```bash
GET /api/3/grupoclientes
```

---

#### Agents (`agentes`)

Manage sales agents.

**List Agents**
```bash
GET /api/3/agentes
```

---

### Products & Inventory

#### Products (`productos`)

Manage product catalog.

**Schema Fields:**
- `idproducto` (int(11), required, auto-increment) - Product ID
- `referencia` (varchar(30), required) - Product reference/SKU
- `descripcion` (text) - Product description
- `precio` (double) - Base price
- `codfamilia` (varchar(8)) - Family code
- `codfabricante` (varchar(8)) - Manufacturer code
- `codimpuesto` (varchar(10)) - Tax code
- `stockfis` (double) - Physical stock
- `nostock` (tinyint(1)) - Product doesn't use stock control
- `secompra` (tinyint(1)) - Can be purchased
- `sevende` (tinyint(1)) - Can be sold
- `publico` (tinyint(1)) - Is public/visible
- `bloqueado` (tinyint(1)) - Is blocked
- `observaciones` (text) - Notes
- `fechaalta` (date) - Creation date
- `tipo` (varchar(50)) - Product type

**List Products**
```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/productos
```

**Get Product Schema**
```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/productos/schema
```

**Create Product**
```bash
curl -X POST \
  -H "Token: YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "referencia": "PROD001",
    "descripcion": "Product Example",
    "precio": 19.99,
    "sevende": 1,
    "secompra": 1
  }' \
  http://192.168.113.1:8899/api/3/productos
```

---

#### Product Families (`familias`)

Manage product categories and families.

**Schema Fields:**
- `codfamilia` (varchar(8), required) - Family code
- `descripcion` (varchar(100), required) - Description
- `madre` (varchar(8)) - Parent family code
- `codsubcuentacom` (varchar(15)) - Purchase sub-account
- `codsubcuentaven` (varchar(15)) - Sales sub-account
- `codsubcuentairpfcom` (varchar(15)) - IRPF purchase sub-account

**List Families**
```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/familias
```

**Get Family Schema**
```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/familias/schema
```

---

#### Manufacturers (`fabricantes`)

Manage product manufacturers.

**List Manufacturers**
```bash
GET /api/3/fabricantes
```

---

#### Attributes (`atributos`)

Manage product attributes (size, color, etc.).

**List Attributes**
```bash
GET /api/3/atributos
```

---

#### Attribute Values (`atributovalores`)

Manage values for product attributes.

**List Attribute Values**
```bash
GET /api/3/atributovalores
```

---

#### Product Variants (`variantes`)

Manage product variants.

**List Variants**
```bash
GET /api/3/variantes
```

---

#### Product Suppliers (`productoproveedores`)

Manage supplier relationships for products.

**List Product Suppliers**
```bash
GET /api/3/productoproveedores
```

---

#### Product Images (`productoimagenes`)

Manage product images.

**List Product Images**
```bash
GET /api/3/productoimagenes
```

---

#### Warehouses (`almacenes`)

Manage warehouse information.

**List Warehouses**
```bash
GET /api/3/almacenes
```

---

#### Stock (`stocks`)

Manage inventory stock levels.

**List Stock**
```bash
GET /api/3/stocks
```

---

#### Price Lists (`tarifas`)

Manage pricing tiers and tariffs.

**List Price Lists**
```bash
GET /api/3/tarifas
```

---

### Sales Documents

#### Customer Invoices (`facturaclientes`)

Manage customer invoices.

**Schema Fields:**
- `idfactura` (int(11), required, auto-increment) - Invoice ID
- `codigo` (varchar(20), required) - Invoice code
- `numero` (varchar(12), required) - Invoice number
- `codserie` (varchar(4), required) - Series code
- `codejercicio` (varchar(4), required) - Fiscal year
- `fecha` (date, required) - Invoice date
- `codcliente` (varchar(10)) - Customer code
- `nombrecliente` (varchar(100), required) - Customer name
- `cifnif` (varchar(30), required) - Customer tax ID
- `direccion` (varchar(200)) - Address
- `ciudad` (varchar(100)) - City
- `provincia` (varchar(100)) - Province
- `codpostal` (varchar(10)) - Postal code
- `codpais` (varchar(20)) - Country code
- `codalmacen` (varchar(4)) - Warehouse code
- `codpago` (varchar(10), required) - Payment method
- `coddivisa` (varchar(3), required) - Currency code
- `tasaconv` (double) - Exchange rate
- `codagente` (varchar(10)) - Agent code
- `neto` (double) - Net amount
- `totaliva` (double) - VAT amount
- `totalirpf` (double) - IRPF amount
- `totalrecargo` (double) - Surcharge amount
- `total` (double) - Total amount
- `pagada` (tinyint(1)) - Is paid
- `vencida` (tinyint(1)) - Is overdue
- `observaciones` (text) - Notes

**List Customer Invoices**
```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/facturaclientes
```

**Get Customer Invoice Schema**
```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/facturaclientes/schema
```

---

#### Customer Invoice Lines (`lineafacturaclientes`)

Manage invoice line items.

**List Invoice Lines**
```bash
GET /api/3/lineafacturaclientes
```

---

#### Customer Delivery Notes (`albaranclientes`)

Manage customer delivery notes.

**List Customer Delivery Notes**
```bash
GET /api/3/albaranclientes
```

---

#### Customer Delivery Note Lines (`lineaalbaranclientes`)

Manage delivery note line items.

**List Delivery Note Lines**
```bash
GET /api/3/lineaalbaranclientes
```

---

#### Customer Orders (`pedidoclientes`)

Manage customer orders.

**List Customer Orders**
```bash
GET /api/3/pedidoclientes
```

---

#### Customer Order Lines (`lineapedidoclientes`)

Manage order line items.

**List Order Lines**
```bash
GET /api/3/lineapedidoclientes
```

---

#### Customer Quotations (`presupuestoclientes`)

Manage customer quotations/estimates.

**List Customer Quotations**
```bash
GET /api/3/presupuestoclientes
```

---

#### Customer Quotation Lines (`lineapresupuestoclientes`)

Manage quotation line items.

**List Quotation Lines**
```bash
GET /api/3/lineapresupuestoclientes
```

---

#### Customer Receipts (`reciboclientes`)

Manage customer payment receipts.

**List Customer Receipts**
```bash
GET /api/3/reciboclientes
```

---

#### Customer Payments (`pagoclientes`)

Track customer payments.

**List Customer Payments**
```bash
GET /api/3/pagoclientes
```

---

### Purchase Documents

#### Supplier Invoices (`facturaproveedores`)

Manage supplier invoices.

**List Supplier Invoices**
```bash
GET /api/3/facturaproveedores
```

---

#### Supplier Invoice Lines (`lineafacturaproveedores`)

Manage supplier invoice line items.

**List Supplier Invoice Lines**
```bash
GET /api/3/lineafacturaproveedores
```

---

#### Supplier Delivery Notes (`albaranproveedores`)

Manage supplier delivery notes.

**List Supplier Delivery Notes**
```bash
GET /api/3/albaranproveedores
```

---

#### Supplier Delivery Note Lines (`lineaalbaranproveedores`)

Manage supplier delivery note line items.

**List Supplier Delivery Note Lines**
```bash
GET /api/3/lineaalbaranproveedores
```

---

#### Supplier Orders (`pedidoproveedores`)

Manage supplier orders.

**List Supplier Orders**
```bash
GET /api/3/pedidoproveedores
```

---

#### Supplier Order Lines (`lineapedidoproveedores`)

Manage supplier order line items.

**List Supplier Order Lines**
```bash
GET /api/3/lineapedidoproveedores
```

---

#### Supplier Quotations (`presupuestoproveedores`)

Manage supplier quotations.

**List Supplier Quotations**
```bash
GET /api/3/presupuestoproveedores
```

---

#### Supplier Quotation Lines (`lineapresupuestoproveedores`)

Manage supplier quotation line items.

**List Supplier Quotation Lines**
```bash
GET /api/3/lineapresupuestoproveedores
```

---

#### Supplier Receipts (`reciboproveedores`)

Manage supplier payment receipts.

**List Supplier Receipts**
```bash
GET /api/3/reciboproveedores
```

---

#### Supplier Payments (`pagoproveedores`)

Track supplier payments.

**List Supplier Payments**
```bash
GET /api/3/pagoproveedores
```

---

### Document Operations

#### Create Customer Delivery Note (`crearAlbaranCliente`)

Create a new customer delivery note.

```bash
POST /api/3/crearAlbaranCliente
```

---

#### Create Supplier Delivery Note (`crearAlbaranProveedor`)

Create a new supplier delivery note.

```bash
POST /api/3/crearAlbaranProveedor
```

---

#### Create Customer Invoice (`crearFacturaCliente`)

Create a new customer invoice.

```bash
POST /api/3/crearFacturaCliente
```

---

#### Create Supplier Invoice (`crearFacturaProveedor`)

Create a new supplier invoice.

```bash
POST /api/3/crearFacturaProveedor
```

---

#### Create Rectifying Customer Invoice (`crearFacturaRectificativaCliente`)

Create a credit note or rectifying invoice.

```bash
POST /api/3/crearFacturaRectificativaCliente
```

---

#### Create Customer Order (`crearPedidoCliente`)

Create a new customer order.

```bash
POST /api/3/crearPedidoCliente
```

---

#### Create Supplier Order (`crearPedidoProveedor`)

Create a new supplier order.

```bash
POST /api/3/crearPedidoProveedor
```

---

#### Create Customer Quotation (`crearPresupuestoCliente`)

Create a new customer quotation.

```bash
POST /api/3/crearPresupuestoCliente
```

---

#### Create Supplier Quotation (`crearPresupuestoProveedor`)

Create a new supplier quotation.

```bash
POST /api/3/crearPresupuestoProveedor
```

---

#### Pay Customer Invoice (`pagarFacturaCliente`)

Mark a customer invoice as paid.

```bash
POST /api/3/pagarFacturaCliente
```

---

#### Pay Supplier Invoice (`pagarFacturaProveedor`)

Mark a supplier invoice as paid.

```bash
POST /api/3/pagarFacturaProveedor
```

---

#### Export Documents

Export documents to various formats:

- `exportarAlbaranCliente` - Export customer delivery note
- `exportarAlbaranProveedor` - Export supplier delivery note
- `exportarFacturaCliente` - Export customer invoice
- `exportarFacturaProveedor` - Export supplier invoice
- `exportarPedidoCliente` - Export customer order
- `exportarPedidoProveedor` - Export supplier order
- `exportarPresupuestoCliente` - Export customer quotation
- `exportarPresupuestoProveedor` - Export supplier quotation

**Example:**
```bash
POST /api/3/exportarFacturaCliente
```

---

### Accounting

#### Accounting Entries (`asientos`)

Manage accounting journal entries.

**List Accounting Entries**
```bash
GET /api/3/asientos
```

---

#### Entry Lines (`partidas`)

Manage accounting entry line items.

**List Entry Lines**
```bash
GET /api/3/partidas
```

---

#### Chart of Accounts (`cuentas`)

Manage account chart.

**List Accounts**
```bash
GET /api/3/cuentas
```

---

#### Sub-accounts (`subcuentas`)

Manage sub-accounts.

**List Sub-accounts**
```bash
GET /api/3/subcuentas
```

---

#### Special Accounts (`cuentaespeciales`)

Manage special account configurations.

**List Special Accounts**
```bash
GET /api/3/cuentaespeciales
```

---

#### Fiscal Years (`ejercicios`)

Manage fiscal years.

**List Fiscal Years**
```bash
GET /api/3/ejercicios
```

---

#### Journals (`diarios`)

Manage accounting journals.

**List Journals**
```bash
GET /api/3/diarios
```

---

#### Tax Models (`codemodeles`)

Manage tax reporting models.

**List Tax Models**
```bash
GET /api/3/codemodeles
```

---

#### Total Models (`totalmodeles`)

View totals for tax models.

**List Total Models**
```bash
GET /api/3/totalmodeles
```

---

#### Tax Regularization (`regularizacionimpuestos`)

Manage tax regularization entries.

**List Tax Regularizations**
```bash
GET /api/3/regularizacionimpuestos
```

---

### Configuration

#### Companies (`empresas`)

Manage company information.

**List Companies**
```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/empresas
```

**Example Response:**
```json
[
  {
    "idempresa": 1,
    "nombre": "GAÑAN VENTURA NATALIA",
    "nombrecorto": "GAÑAN VENTURA NATALIA",
    "cifnif": "49066321F",
    "tipoidfiscal": "DNI",
    "personafisica": true,
    "direccion": "Calle Giganta Andandona 3, Portal 3, 1ºC",
    "ciudad": "Getafe",
    "provincia": "Madrid",
    "codpostal": "28906",
    "codpais": "ESP",
    "telefono1": "627153667",
    "telefono2": "",
    "email": "natalia@cafeelgato.com",
    "web": "",
    "regimeniva": "General"
  }
]
```

---

#### Payment Methods (`formapagos`)

Manage payment methods.

**List Payment Methods**
```bash
GET /api/3/formapagos
```

---

#### Document Series (`series`)

Manage document numbering series.

**List Series**
```bash
GET /api/3/series
```

---

#### Document Sequences (`secuenciadocumentos`)

Manage document sequence numbering.

**List Document Sequences**
```bash
GET /api/3/secuenciadocumentos
```

---

#### Document Formats (`formatodocumentos`)

Manage document print formats and templates.

**List Document Formats**
```bash
GET /api/3/formatodocumentos
```

---

#### Document States (`estadodocumentos`)

Manage document workflow states.

**List Document States**
```bash
GET /api/3/estadodocumentos
```

---

#### Document Transformations (`doctransformations`)

Manage document transformation rules (e.g., quote to order).

**List Document Transformations**
```bash
GET /api/3/doctransformations
```

---

#### Taxes (`impuestos`)

Manage tax rates.

**List Taxes**
```bash
GET /api/3/impuestos
```

---

#### Tax Zones (`impuestozonas`)

Manage tax zones for different regions.

**List Tax Zones**
```bash
GET /api/3/impuestozonas
```

---

#### Retentions (`retenciones`)

Manage withholding tax (IRPF) rates.

**List Retentions**
```bash
GET /api/3/retenciones
```

---

#### Currencies (`divisas`)

Manage currencies.

**List Currencies**
```bash
GET /api/3/divisas
```

---

#### Transport Agencies (`agenciatransportes`)

Manage shipping carriers.

**List Transport Agencies**
```bash
GET /api/3/agenciatransportes
```

---

#### Bank Accounts (`cuentabancos`)

Manage company bank accounts.

**List Bank Accounts**
```bash
GET /api/3/cuentabancos
```

---

#### Customer Bank Accounts (`cuentabancoclientes`)

Manage customer bank account information.

**List Customer Bank Accounts**
```bash
GET /api/3/cuentabancoclientes
```

---

#### Supplier Bank Accounts (`cuentabancoproveedores`)

Manage supplier bank account information.

**List Supplier Bank Accounts**
```bash
GET /api/3/cuentabancoproveedores
```

---

### System & Administration

#### Users (`users`)

Manage system users.

**List Users**
```bash
GET /api/3/users
```

---

#### Roles (`roles`)

Manage user roles.

**List Roles**
```bash
GET /api/3/roles
```

---

#### Role Users (`roleusers`)

Manage role assignments to users.

**List Role Users**
```bash
GET /api/3/roleusers
```

---

#### Role Access (`roleaccess`)

Manage role permissions and access rules.

**List Role Access**
```bash
GET /api/3/roleaccess
```

---

#### API Keys (`apikeyes`)

Manage API authentication keys.

**List API Keys**
```bash
GET /api/3/apikeyes
```

---

#### API Access (`apiaccess`)

Manage API access logs and permissions.

**List API Access**
```bash
GET /api/3/apiaccess
```

---

#### Settings (`settings`)

Manage system settings.

**List Settings**
```bash
GET /api/3/settings
```

---

#### Pages (`pages`)

Manage custom pages and views.

**List Pages**
```bash
GET /api/3/pages
```

---

#### Page Options (`pageoptions`)

Manage page configuration options.

**List Page Options**
```bash
GET /api/3/pageoptions
```

---

#### Page Filters (`pagefilteres`)

Manage page filter configurations.

**List Page Filters**
```bash
GET /api/3/pagefilteres
```

---

#### Plugins (`plugins`)

Manage installed plugins.

**List Plugins**
```bash
GET /api/3/plugins
```

---

#### Cron Jobs (`cronjobes`)

Manage scheduled tasks.

**List Cron Jobs**
```bash
GET /api/3/cronjobes
```

---

#### Work Events (`workevent`)

Track background work and events.

**List Work Events**
```bash
GET /api/3/workevent
```

---

#### Log Messages (`logmessages`)

View system logs.

**List Log Messages**
```bash
GET /api/3/logmessages
```

---

#### Email Notifications (`emailnotifications`)

Manage email notification templates.

**List Email Notifications**
```bash
GET /api/3/emailnotifications
```

---

#### Sent Emails (`emailsentes`)

View sent email history.

**List Sent Emails**
```bash
GET /api/3/emailsentes
```

---

#### Attached Files (`attachedfiles`)

Manage file attachments.

**List Attached Files**
```bash
GET /api/3/attachedfiles
```

---

#### Attached File Relations (`attachedfilerelations`)

Manage relationships between files and entities.

**List Attached File Relations**
```bash
GET /api/3/attachedfilerelations
```

---

#### Upload Files (`uploadFiles`)

Upload files to the system.

```bash
POST /api/3/uploadFiles
```

---

#### Points of Interest in Cities (`puntointeresciudades`)

Manage points of interest within cities.

**List Points of Interest**
```bash
GET /api/3/puntointeresciudades
```

---

#### Concept Lines (`conceptopartidas`)

Manage predefined accounting concepts.

**List Concept Lines**
```bash
GET /api/3/conceptopartidas
```

---

### VeriFact (Electronic Invoice Verification)

Electronic invoice verification system integration endpoints:

#### VeriFact (`verifactu`)

Main VeriFact configuration.

**List VeriFact**
```bash
GET /api/3/verifactu
```

---

#### VeriFact Invoice Registry (`verifacturegistrofacturas`)

Invoice registration records.

**List Invoice Registry**
```bash
GET /api/3/verifacturegistrofacturas
```

---

#### VeriFact Event Registry (`verifacturegistroeventos`)

Event registration records.

**List Event Registry**
```bash
GET /api/3/verifacturegistroeventos
```

---

#### VeriFact Requirements (`verifacturequerimientos`)

Compliance requirements.

**List Requirements**
```bash
GET /api/3/verifacturequerimientos
```

---

#### VeriFact Requirement Lines (`verifacturequerimientolines`)

Detailed requirement line items.

**List Requirement Lines**
```bash
GET /api/3/verifacturequerimientolines
```

---

## Schemas

### Getting Schema Information

Every resource endpoint provides schema information that describes the database structure and field types:

```bash
GET /api/3/{resource}/schema
```

**Example Response for `familias`:**
```json
{
  "codfamilia": {
    "type": "varchar(8)",
    "default": null,
    "is_nullable": "NO"
  },
  "descripcion": {
    "type": "varchar(100)",
    "default": null,
    "is_nullable": "NO"
  },
  "madre": {
    "type": "varchar(8)",
    "default": null,
    "is_nullable": "YES"
  },
  "codsubcuentacom": {
    "type": "varchar(15)",
    "default": null,
    "is_nullable": "YES"
  },
  "codsubcuentaven": {
    "type": "varchar(15)",
    "default": null,
    "is_nullable": "YES"
  }
}
```

### Common Field Types

| Type | Description |
|------|-------------|
| `varchar(n)` | Variable-length string, max n characters |
| `int(n)` | Integer number |
| `double` | Floating-point number |
| `date` | Date field (YYYY-MM-DD) |
| `time` | Time field (HH:MM:SS) |
| `timestamp` | Date and time |
| `text` | Long text field |
| `tinyint(1)` | Boolean (0 or 1) |

### Field Properties

- **type**: Database column type
- **default**: Default value if not provided
- **is_nullable**: "YES" if field can be null, "NO" if required

---

## Complete Resource List

Here's the complete list of all **142 endpoints** available in the API:

1. agenciatransportes
2. agentes
3. albaranclientes
4. albaranproveedores
5. almacenes
6. apiaccess
7. apikeyes
8. asientos
9. atributos
10. atributovalores
11. attachedfilerelations
12. attachedfiles
13. ciudades
14. clientes
15. codemodeles
16. codigopostales
17. conceptopartidas
18. contactos
19. crearAlbaranCliente
20. crearAlbaranProveedor
21. crearFacturaCliente
22. crearFacturaProveedor
23. crearFacturaRectificativaCliente
24. crearPedidoCliente
25. crearPedidoProveedor
26. crearPresupuestoCliente
27. crearPresupuestoProveedor
28. cronjobes
29. cuentabancoclientes
30. cuentabancoproveedores
31. cuentabancos
32. cuentaespeciales
33. cuentas
34. diarios
35. divisas
36. doctransformations
37. ejercicios
38. emailnotifications
39. emailsentes
40. empresas
41. estadodocumentos
42. exportarAlbaranCliente
43. exportarAlbaranProveedor
44. exportarFacturaCliente
45. exportarFacturaProveedor
46. exportarPedidoCliente
47. exportarPedidoProveedor
48. exportarPresupuestoCliente
49. exportarPresupuestoProveedor
50. fabricantes
51. facturaclientes
52. facturaproveedores
53. familias
54. formapagos
55. formatodocumentos
56. grupoclientes
57. identificadorfiscales
58. impuestos
59. impuestozonas
60. lineaalbaranclientes
61. lineaalbaranproveedores
62. lineafacturaclientes
63. lineafacturaproveedores
64. lineapedidoclientes
65. lineapedidoproveedores
66. lineapresupuestoclientes
67. lineapresupuestoproveedores
68. logmessages
69. pagarFacturaCliente
70. pagarFacturaProveedor
71. pagefilteres
72. pageoptions
73. pages
74. pagoclientes
75. pagoproveedores
76. pais
77. partidas
78. pedidoclientes
79. pedidoproveedores
80. plugins
81. presupuestoclientes
82. presupuestoproveedores
83. productoimagenes
84. productoproveedores
85. productos
86. proveedores
87. provincias
88. puntointeresciudades
89. reciboclientes
90. reciboproveedores
91. regularizacionimpuestos
92. retenciones
93. roleaccess
94. roles
95. roleusers
96. secuenciadocumentos
97. series
98. settings
99. stocks
100. subcuentas
101. tarifas
102. totalmodeles
103. uploadFiles
104. users
105. variantes
106. verifactu
107. verifacturegistroeventos
108. verifacturegistrofacturas
109. verifacturequerimientolines
110. verifacturequerimientos
111. workevent

---

## Examples

### Example 1: List All Customers

```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/clientes
```

### Example 2: Get Product Schema

```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/productos/schema
```

### Example 3: Create a New Product

```bash
curl -X POST \
  -H "Token: YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "referencia": "PROD123",
    "descripcion": "Example Product",
    "precio": 29.99,
    "sevende": 1,
    "secompra": 1,
    "codfamilia": "FAM01",
    "stockfis": 100
  }' \
  http://192.168.113.1:8899/api/3/productos
```

### Example 4: Update a Customer

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

### Example 5: Get Company Information

```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/empresas
```

---

## Best Practices

1. **Always include the Token header** in every request
2. **Use HTTPS in production** environments
3. **Check the schema** before creating or updating resources
4. **Handle errors gracefully** and check HTTP status codes
5. **Use pagination** for large datasets (check API documentation for pagination parameters)
6. **Cache schema information** to reduce unnecessary API calls
7. **Test in a development environment** before making changes in production
8. **Keep API keys secure** and never commit them to version control

---

## Additional Resources

- **Official Documentation**: https://facturascripts.com/publicaciones/la-api-rest-de-facturascripts-912
- **FacturaScripts Website**: https://facturascripts.com/
- **GitHub Repository**: https://github.com/NeoRazorX/facturascripts
- **Community Support**: https://discord.gg/qKm7j9AaJT

---

## Changelog

### Version 3
- Initial REST API version
- Support for all core FacturaScripts entities
- Token-based authentication
- JSON response format
- Schema introspection endpoints

---

*This documentation was generated on November 10, 2025*
