-- Animais com nome e peso válidos
SELECT * FROM animal WHERE nome IS NOT NULL AND nome <> '' AND peso > 0;

-- Animais com abrigo existente
SELECT a.* FROM animal a JOIN abrigo ab ON a.id_abrigo = ab.id_abrigo;

-- Doações com doador e animal existentes
SELECT d.* FROM doacao d
JOIN doador dr ON d.id_doador = dr.id_doador
JOIN animal a ON d.id_animal = a.id_animal;

-- Adoções com adotante e animal existentes
SELECT ad.* FROM adocao ad
JOIN adotante at ON ad.id_adotante = at.id_adotante
JOIN animal a ON ad.id_animal = a.id_animal;

-- Adoções com data preenchida
SELECT * FROM adocao WHERE data_adocao IS NOT NULL;

-- Voluntários com nome e email válidos
SELECT * FROM voluntario WHERE nome IS NOT NULL AND nome <> '' AND email IS NOT NULL AND email <> '';

-- Voluntários que trabalham em abrigos existentes
SELECT te.* FROM trabalha_em te
JOIN abrigo ab ON te.id_abrigo = ab.id_abrigo;

-- Veterinários com especialidade válida
SELECT * FROM veterinario WHERE especialidade IS NOT NULL AND especialidade <> '';

-- Cuidados com veterinário e animal existentes
SELECT c.* FROM cuida c
JOIN veterinario v ON c.id_veterinario = v.id_veterinario
JOIN animal a ON c.id_animal = a.id_animal;

-- Doadores com nome e telefone preenchidos
SELECT * FROM doador WHERE nome IS NOT NULL AND nome <> '' AND telefone IS NOT NULL AND telefone <> '';
