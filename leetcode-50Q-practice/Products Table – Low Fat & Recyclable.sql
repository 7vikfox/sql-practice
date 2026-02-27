# LeetCode SQL Notes

## Problem: Products Table – Low Fat & Recyclable
- Table: Products
  - product_id (int, PK)
  - low_fats (ENUM 'Y', 'N')
  - recyclable (ENUM 'Y', 'N')
- Goal: Find product_ids where both low_fats = 'Y' AND recyclable = 'Y'

## Solution
```sql
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
