SELECT la.id as id, la.title as Title, la.image_data, c.id as Category_ID, c.name as Category_Name
FROM categories c
INNER JOIN
(SELECT id, title, category_id, image_data FROM articles WHERE id IN (SELECT MAX(id) OVER  (PARTITION BY category_id) FROM articles ORDER BY id DESC)) la
ON c.id = la.category_id
ORDER BY c.priority