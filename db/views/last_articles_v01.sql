SELECT la.id as id, la.title as Title, c.id as Category_ID, c.name as Category_Name, actstor.record_id as ActiveStorage_Image
FROM categories c
INNER JOIN
(SELECT id, title, category_id FROM articles WHERE id IN (SELECT MAX(id) OVER  (PARTITION BY category_id) FROM articles ORDER BY id DESC)) la
ON c.id = la.category_id
INNER JOIN
active_storage_attachments actstor
ON la.id = actstor.record_id
ORDER BY c.priority