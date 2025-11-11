#!/bin/bash

# FacturaScripts API Documentation Test Suite
# This script tests key endpoints to verify documentation accuracy

# Configuration
BASE_URL="http://192.168.113.1:8899/api/3"
TOKEN="YOUR_TOKEN"
HEADER="Token: ${TOKEN}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "================================================"
echo "FacturaScripts API Documentation Test Suite"
echo "================================================"
echo ""
echo "Testing API: ${BASE_URL}"
echo ""

# Test counter
PASSED=0
FAILED=0

# Function to test an endpoint
test_endpoint() {
    local name=$1
    local endpoint=$2
    local expected_status=${3:-200}
    
    echo -n "Testing ${name}... "
    
    response=$(curl -s -w "\n%{http_code}" -H "${HEADER}" "${BASE_URL}${endpoint}")
    http_code=$(echo "$response" | tail -n1)
    body=$(echo "$response" | sed '$d')
    
    if [ "$http_code" -eq "$expected_status" ]; then
        echo -e "${GREEN}✓ PASSED${NC} (HTTP ${http_code})"
        PASSED=$((PASSED + 1))
        return 0
    else
        echo -e "${RED}✗ FAILED${NC} (Expected HTTP ${expected_status}, got ${http_code})"
        FAILED=$((FAILED + 1))
        return 1
    fi
}

# Test authentication
echo "=== Testing Authentication ==="
test_endpoint "Authentication" ""
echo ""

# Test master data endpoints
echo "=== Testing Master Data Endpoints ==="
test_endpoint "Countries" "/pais"
test_endpoint "Provinces" "/provincias"
test_endpoint "Cities" "/ciudades"
test_endpoint "Postal Codes" "/codigopostales"
echo ""

# Test customer endpoints
echo "=== Testing Customer Endpoints ==="
test_endpoint "List Customers" "/clientes"
test_endpoint "Customer Schema" "/clientes/schema"
echo ""

# Test product endpoints
echo "=== Testing Product Endpoints ==="
test_endpoint "List Products" "/productos"
test_endpoint "Product Schema" "/productos/schema"
test_endpoint "List Families" "/familias"
test_endpoint "Family Schema" "/familias/schema"
echo ""

# Test sales documents
echo "=== Testing Sales Documents ==="
test_endpoint "Customer Invoices" "/facturaclientes"
test_endpoint "Invoice Schema" "/facturaclientes/schema"
test_endpoint "Invoice Lines" "/lineafacturaclientes"
test_endpoint "Delivery Notes" "/albaranclientes"
test_endpoint "Customer Orders" "/pedidoclientes"
test_endpoint "Customer Quotations" "/presupuestoclientes"
echo ""

# Test purchase documents
echo "=== Testing Purchase Documents ==="
test_endpoint "Supplier Invoices" "/facturaproveedores"
test_endpoint "Supplier Delivery Notes" "/albaranproveedores"
test_endpoint "Supplier Orders" "/pedidoproveedores"
echo ""

# Test accounting
echo "=== Testing Accounting Endpoints ==="
test_endpoint "Accounting Entries" "/asientos"
test_endpoint "Chart of Accounts" "/cuentas"
test_endpoint "Sub-accounts" "/subcuentas"
test_endpoint "Fiscal Years" "/ejercicios"
echo ""

# Test configuration
echo "=== Testing Configuration Endpoints ==="
test_endpoint "Companies" "/empresas"
test_endpoint "Payment Methods" "/formapagos"
test_endpoint "Document Series" "/series"
test_endpoint "Taxes" "/impuestos"
test_endpoint "Tax Schema" "/impuestos/schema"
test_endpoint "Currencies" "/divisas"
echo ""

# Test inventory
echo "=== Testing Inventory Endpoints ==="
test_endpoint "Warehouses" "/almacenes"
test_endpoint "Stock" "/stocks"
test_endpoint "Variants" "/variantes"
echo ""

# Test administration
echo "=== Testing Administration Endpoints ==="
test_endpoint "Users" "/users"
test_endpoint "Roles" "/roles"
test_endpoint "API Keys" "/apikeyes"
test_endpoint "Settings" "/settings"
echo ""

# Test supplier management
echo "=== Testing Supplier Management ==="
test_endpoint "Suppliers" "/proveedores"
test_endpoint "Contacts" "/contactos"
test_endpoint "Sales Agents" "/agentes"
echo ""

# Test additional resources
echo "=== Testing Additional Resources ==="
test_endpoint "Manufacturers" "/fabricantes"
test_endpoint "Bank Accounts" "/cuentabancos"
test_endpoint "Customer Groups" "/grupoclientes"
echo ""

# Summary
echo "================================================"
echo "Test Summary"
echo "================================================"
echo -e "Tests Passed: ${GREEN}${PASSED}${NC}"
echo -e "Tests Failed: ${RED}${FAILED}${NC}"
echo "Total Tests: $((PASSED + FAILED))"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}✓ All tests passed! Documentation is accurate.${NC}"
    exit 0
else
    echo -e "${YELLOW}⚠ Some tests failed. Please review the documentation.${NC}"
    exit 1
fi
