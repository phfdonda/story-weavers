SELECT MAX(id) OVER (PARTITION BY category_id) FROM articles ORDER BY id DESC;