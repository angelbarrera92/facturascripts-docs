# 📚 FacturaScripts API Documentation Suite

Complete documentation package for the FacturaScripts REST API v3.

## 📦 Package Contents

This documentation suite includes **5 comprehensive files** covering all aspects of the FacturaScripts REST API:

### 1. 📖 Main Documentation (`facturascripts-api-documentation.md`)
**Size:** ~40 KB | **Type:** Markdown

Complete reference documentation including:
- ✅ Authentication guide
- ✅ All 142 API endpoints
- ✅ Detailed schemas for major resources
- ✅ Request/response examples
- ✅ Error handling
- ✅ Best practices

**Use for:** Learning, implementation reference, onboarding developers

---

### 2. 🔧 OpenAPI Specification (`facturascripts-api-openapi.yaml`)
**Size:** ~35 KB | **Type:** YAML (OpenAPI 3.0)

Machine-readable API specification featuring:
- ✅ Complete endpoint definitions
- ✅ Schema models for key resources
- ✅ Authentication configuration
- ✅ Response examples
- ✅ Error responses

**Use for:** 
- Swagger UI/Editor
- Code generation (clients in any language)
- API testing tools
- IDE integration
- Documentation portals

---

### 3. 📋 Quick Reference (`QUICK-REFERENCE-API.md`)
**Size:** ~8 KB | **Type:** Markdown

Condensed cheat sheet with:
- ✅ Most commonly used endpoints
- ✅ Quick command examples
- ✅ HTTP methods & status codes
- ✅ Common patterns
- ✅ Top 20 endpoints list

**Use for:** Daily reference, quick lookups, command-line usage

---

### 4. 🚀 Setup Guide (`README-API.md`)
**Size:** ~15 KB | **Type:** Markdown

Complete getting started guide with:
- ✅ Installation instructions
- ✅ Authentication setup
- ✅ Tool integration (Postman, Swagger, Insomnia)
- ✅ Code examples (Node.js, Python, PHP)
- ✅ Testing & validation
- ✅ Common issues & troubleshooting

**Use for:** Initial setup, integration, tooling configuration

---

### 5. 📮 Postman Collection (`facturascripts-api-postman-collection.json`)
**Size:** ~20 KB | **Type:** JSON (Postman Collection v2.1)

Ready-to-import collection with:
- ✅ Pre-configured requests for major endpoints
- ✅ Environment variables
- ✅ Authentication setup
- ✅ Organized by resource category
- ✅ Example request bodies

**Use for:** Testing, development, API exploration

---

## 🎯 Quick Start Guide

### For Developers New to the API

1. Start with `README-API.md` for setup
2. Reference `QUICK-REFERENCE-API.md` for common tasks
3. Deep dive into `facturascripts-api-documentation.md` for details

### For Integration Teams

1. Import `facturascripts-api-openapi.yaml` into Swagger UI
2. Import `facturascripts-api-postman-collection.json` into Postman
3. Use generated clients from OpenAPI spec

### For Quick Testing

1. Import Postman collection
2. Set token variable: `YOUR_TOKEN`
3. Start making requests!

---

## 🔐 API Credentials

**Instance URL:** `http://192.168.113.1:8899/api/3`  
**Authentication Token:** `YOUR_TOKEN`

All requests require the `Token` header:
```bash
Token: YOUR_TOKEN
```

---

## 📊 API Coverage

### Total Endpoints: 142

**Categories:**
- 🌍 Master Data (5 endpoints)
- 👥 Customers & Suppliers (11 endpoints)
- 📦 Products & Inventory (15 endpoints)
- 🧾 Sales Documents (18 endpoints)
- 📥 Purchase Documents (12 endpoints)
- 📊 Accounting (15 endpoints)
- ⚙️ Configuration (20 endpoints)
- 🔧 Administration (15 endpoints)
- 🔄 Document Operations (20 endpoints)
- 📝 VeriFact (11 endpoints)

---

## 🛠️ Supported Tools

### Interactive Documentation
- ✅ Swagger UI
- ✅ Swagger Editor
- ✅ ReDoc

### API Clients
- ✅ Postman
- ✅ Insomnia
- ✅ Thunder Client (VS Code)
- ✅ REST Client (VS Code)

### Code Generation
- ✅ OpenAPI Generator (25+ languages)
- ✅ Swagger Codegen
- ✅ AutoRest

### Programming Languages
- ✅ JavaScript/TypeScript (examples included)
- ✅ Python (examples included)
- ✅ PHP (examples included)
- ✅ Any language via OpenAPI generation

---

## 📖 Documentation Standards

This documentation follows:
- ✅ OpenAPI 3.0 specification
- ✅ RESTful API best practices
- ✅ Markdown formatting standards
- ✅ Postman Collection v2.1 format

---

## 🔍 Key Features Documented

### Complete CRUD Operations
```bash
GET    /api/3/{resource}        # List all
GET    /api/3/{resource}/{id}   # Get one
POST   /api/3/{resource}        # Create
PUT    /api/3/{resource}/{id}   # Update
DELETE /api/3/{resource}/{id}   # Delete
```

### Schema Discovery
```bash
GET /api/3/{resource}/schema    # Get field definitions
```

### Special Operations
- Document creation workflows
- Payment operations
- Export functions
- VeriFact electronic invoice verification

---

## 📥 How to Use Each File

### Markdown Files (.md)
```bash
# View in terminal
cat facturascripts-api-documentation.md

# View in VS Code
code facturascripts-api-documentation.md

# Convert to HTML
pandoc facturascripts-api-documentation.md -o output.html

# Convert to PDF
pandoc facturascripts-api-documentation.md -o output.pdf
```

### OpenAPI Spec (.yaml)
```bash
# Validate
npx @apidevtools/swagger-cli validate facturascripts-api-openapi.yaml

# View in Swagger UI (Docker)
docker run -p 8080:8080 \
  -e SWAGGER_JSON=/api/facturascripts-api-openapi.yaml \
  -v $(pwd):/api \
  swaggerapi/swagger-ui

# Generate client (TypeScript)
npx @openapitools/openapi-generator-cli generate \
  -i facturascripts-api-openapi.yaml \
  -g typescript-axios \
  -o ./client
```

### Postman Collection (.json)
```bash
# Import into Postman
1. Open Postman
2. Click "Import"
3. Select facturascripts-api-postman-collection.json
4. Set environment variable: token = YOUR_TOKEN
```

---

## 🎓 Learning Path

### Beginner
1. Read `README-API.md` (Setup)
2. Import Postman collection
3. Try the examples in `QUICK-REFERENCE-API.md`

### Intermediate
1. Explore full documentation in `facturascripts-api-documentation.md`
2. Use schema endpoints to understand data structures
3. Build basic integrations

### Advanced
1. Use OpenAPI spec for code generation
2. Build comprehensive integrations
3. Contribute improvements to documentation

---

## 🔄 Updating Documentation

When API changes occur:

1. **Update OpenAPI Spec** (`facturascripts-api-openapi.yaml`)
   - Modify endpoint definitions
   - Update schemas
   - Add new endpoints

2. **Update Main Documentation** (`facturascripts-api-documentation.md`)
   - Add/modify endpoint descriptions
   - Update examples
   - Add new sections

3. **Update Quick Reference** (`QUICK-REFERENCE-API.md`)
   - Add commonly used new endpoints
   - Update examples

4. **Update Postman Collection** (`facturascripts-api-postman-collection.json`)
   - Add new requests
   - Update variables

5. **Validate Everything**
   ```bash
   # Validate OpenAPI
   npx @apidevtools/swagger-cli validate facturascripts-api-openapi.yaml
   
   # Test Postman collection
   newman run facturascripts-api-postman-collection.json
   ```

---

## 📚 Additional Resources

### Official FacturaScripts
- **Documentation:** https://facturascripts.com/publicaciones/la-api-rest-de-facturascripts-912
- **Website:** https://facturascripts.com/
- **GitHub:** https://github.com/NeoRazorX/facturascripts
- **Discord:** https://discord.gg/qKm7j9AaJT

### API Standards
- **OpenAPI Spec:** https://swagger.io/specification/
- **REST API Guide:** https://restfulapi.net/
- **HTTP Status Codes:** https://httpstatuses.com/

### Tools
- **Swagger UI:** https://swagger.io/tools/swagger-ui/
- **Postman:** https://www.postman.com/
- **Insomnia:** https://insomnia.rest/
- **OpenAPI Generator:** https://openapi-generator.tech/

---

## 🤝 Contributing

To improve this documentation:

1. Test endpoints against the actual API
2. Document any discrepancies
3. Add missing examples
4. Clarify unclear sections
5. Update schemas as API evolves

---

## ⚠️ Important Notes

1. **Token Security**: Keep your API token secure and never commit it to version control
2. **API Version**: This documentation is for API v3 (`/api/3`)
3. **Production Use**: Test thoroughly in development before using in production
4. **Rate Limits**: Confirm rate limiting policies with your administrator
5. **Data Validation**: Always validate data before sending to the API

---

## 📊 Documentation Statistics

- **Total Pages:** ~100 pages (if printed)
- **Total Examples:** 50+ code examples
- **Languages Covered:** Bash, JavaScript, Python, PHP
- **Endpoints Documented:** 142
- **Schemas Detailed:** 10+ major resources
- **Last Updated:** November 10, 2025

---

## 🎉 Quick Test

Test your setup with this command:

```bash
curl -H "Token: YOUR_TOKEN" \
  http://192.168.113.1:8899/api/3/empresas
```

Expected: JSON response with company information

---

## 📞 Support

For API issues or questions:
- **FacturaScripts Support:** https://facturascripts.com/contacto
- **Community Discord:** https://discord.gg/qKm7j9AaJT
- **GitHub Issues:** https://github.com/NeoRazorX/facturascripts/issues

---

**Documentation Package Version:** 1.0  
**API Version:** 3  
**Created:** November 10, 2025  
**Format:** Markdown + OpenAPI 3.0 + Postman Collection v2.1
