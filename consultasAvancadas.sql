-- 1. Lista os animais que foram adotados com nome do adotante e data da adoção
SELECT a.nome AS nome_animal, adt.nome AS nome_adotante, ad.data_adocao
FROM animal a
JOIN adocao ad ON a.id_animal = ad.id_animal
JOIN adotante adt ON ad.id_adotante = adt.id_adotante
WHERE a.nome IS NOT NULL AND adt.nome IS NOT NULL AND ad.data_adocao IS NOT NULL;

-- 2. Mostra o total de animais que estão atualmente em cada abrigo
SELECT ab.nome AS abrigo, COUNT(an.id_animal) AS total_animais
FROM abrigo ab
JOIN animal an ON ab.id_abrigo = an.id_abrigo
GROUP BY ab.nome;

-- 3. Lista os veterinários e a quantidade de animais sob seus cuidados
SELECT v.nome, COUNT(c.id_animal) AS total_cuidados
FROM veterinario v
JOIN cuida c ON v.id_veterinario = c.id_veterinario
GROUP BY v.nome
HAVING COUNT(*) > 0;

-- 4. Mostra o nome do animal, nome do doador e condição na doação
SELECT an.nome AS animal, d.nome AS doador, dc.condicao_animal
FROM doacao dc
JOIN animal an ON an.id_animal = dc.id_animal
JOIN doador d ON d.id_doador = dc.id_doador
WHERE dc.condicao_animal IS NOT NULL;

-- 5. Lista os voluntários e os abrigos em que trabalham
SELECT v.nome AS voluntario, ab.nome AS abrigo
FROM trabalha_em t
JOIN voluntario v ON v.id_voluntario = t.id_voluntario
JOIN abrigo ab ON ab.id_abrigo = t.id_abrigo;

-- 6. Mostra os animais com peso acima de 30kg
SELECT nome, peso, especie
FROM animal
WHERE peso > 30;

-- 7. Mostra quantas adoções ocorreram por espécie de animal
SELECT an.especie, COUNT(*) AS total_adocoes
FROM adocao ad
JOIN animal an ON ad.id_animal = an.id_animal
GROUP BY an.especie;

-- 8. Mostra os animais que foram doados e depois adotados
SELECT a.nome, d.data_doacao, ad.data_adocao
FROM animal a
JOIN doacao d ON a.id_animal = d.id_animal
JOIN adocao ad ON a.id_animal = ad.id_animal;

-- 9. Lista os doadores que realizaram mais de uma doação
SELECT d.nome, COUNT(*) AS total_doacoes
FROM doacao dc
JOIN doador d ON d.id_doador = dc.id_doador
GROUP BY d.nome
HAVING COUNT(*) > 1;

-- 10. Mostra animais que são cuidados por dois ou mais veterinários
SELECT a.nome, COUNT(*) AS total_veterinarios
FROM animal a
JOIN cuida c ON c.id_animal = a.id_animal
GROUP BY a.nome
HAVING COUNT(*) > 1;
