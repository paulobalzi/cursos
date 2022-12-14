--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cidades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cidades (
    id integer NOT NULL,
    nome character varying(50)
);


ALTER TABLE public.cidades OWNER TO postgres;

--
-- Name: cidades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cidades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cidades_id_seq OWNER TO postgres;

--
-- Name: cidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cidades_id_seq OWNED BY cidades.id;


--
-- Name: grupos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE grupos (
    id integer NOT NULL,
    nome character(1)
);


ALTER TABLE public.grupos OWNER TO postgres;

--
-- Name: grupos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE grupos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupos_id_seq OWNER TO postgres;

--
-- Name: grupos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE grupos_id_seq OWNED BY grupos.id;


--
-- Name: grupos_times; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE grupos_times (
    idgrupo integer NOT NULL,
    idtime integer NOT NULL
);


ALTER TABLE public.grupos_times OWNER TO postgres;

--
-- Name: jogos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jogos (
    id integer NOT NULL,
    idtime1 integer,
    idtime2 integer,
    data timestamp without time zone,
    idcidade integer
);


ALTER TABLE public.jogos OWNER TO postgres;

--
-- Name: jogos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jogos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jogos_id_seq OWNER TO postgres;

--
-- Name: jogos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jogos_id_seq OWNED BY jogos.id;


--
-- Name: times; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE times (
    id integer NOT NULL,
    nome character varying(50),
    historia text
);


ALTER TABLE public.times OWNER TO postgres;

--
-- Name: times_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.times_id_seq OWNER TO postgres;

--
-- Name: times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE times_id_seq OWNED BY times.id;


--
-- Name: v_grupos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v_grupos AS
    SELECT g.nome AS grupo, t.nome AS "time" FROM ((grupos_times gt JOIN times t ON ((gt.idtime = t.id))) JOIN grupos g ON ((gt.idgrupo = g.id))) ORDER BY g.nome;


ALTER TABLE public.v_grupos OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidades ALTER COLUMN id SET DEFAULT nextval('cidades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupos ALTER COLUMN id SET DEFAULT nextval('grupos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jogos ALTER COLUMN id SET DEFAULT nextval('jogos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY times ALTER COLUMN id SET DEFAULT nextval('times_id_seq'::regclass);


--
-- Data for Name: cidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cidades (id, nome) FROM stdin;
1	S??o Paulo
2	Rio de Janeiro
3	Belo Horizonte
5	Fortaleza
6	Brasilia
7	Recife
8	Natal
9	Manaus
10	Cuiaba
11	Curitiba
12	Porto Alegre
4	Salvador
\.


--
-- Name: cidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cidades_id_seq', 12, true);


--
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grupos (id, nome) FROM stdin;
1	A
2	B
3	C
4	D
5	E
6	F
8	H
7	G
\.


--
-- Name: grupos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('grupos_id_seq', 8, true);


--
-- Data for Name: grupos_times; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grupos_times (idgrupo, idtime) FROM stdin;
1	1
1	33
1	9
1	26
2	8
2	18
2	20
2	24
3	12
3	32
3	23
4	5
4	28
4	6
5	11
5	13
5	7
5	29
6	4
6	31
6	21
6	15
7	3
7	19
7	27
7	14
8	30
8	16
8	17
8	22
3	25
4	2
\.


--
-- Data for Name: jogos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jogos (id, idtime1, idtime2, data, idcidade) FROM stdin;
\.


--
-- Name: jogos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jogos_id_seq', 1, false);


--
-- Data for Name: times; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY times (id, nome, historia) FROM stdin;
1	Brasil	Sem d??vidas, a sele????o que mais entra pressionada na Copa do Mundo ?? o Brasil. Jogando em casa, precisando retirar o estigma de que as sele????es que ganham a Copa das Confedera????es nunca v??o bem no mundial e precisando acalmar os anseios da popula????o, que n??o vai aceitar menos que a ta??a, os canarinhos entrar??o em campo precisando se firmar e acabar com as cr??ticas.\nA nova "Fam??lia Scolari" j?? est?? quase toda formada e restam apenas algumas pequenas d??vidas. No gol, J??lio C??sar quase n??o joga em seu clube e pode ter sua titularidade amea??ada. J?? no setor ofensivo, Fred praticamente n??o jogou no Fluminense ap??s ser titular e principal artilheiro da sele????o no t??tulo da Copa das Confedera????es, e, portanto, ainda h?? uma vaga para um centroavante.\nAs esperan??as est??o nos p??s de Neymar, que hoje ?? o grande nome verde e amarelo no futebol mundial, mas ele n??o ?? o ??nico. Outros jogadores, como Thiago Silva, Paulinho, Oscar e Hulk tamb??m podem ser determinantes em um poss??vel t??tulo, j?? que o jogo coletivo ?? sempre uma grande arma dos times comandados por Felip??o
33	Croacia	N??o ?? a gera????o de 1998, com Suker e Cia., mas ?? uma safra de qualidade. Comandada por Mandzukic, Modric e Srna, a Cro??cia pode pensar pelo menos em passar da fase de grupos. Cair antes disso seria decepcionante. \nO time chega para o torneio depois de passar por um grupo enjoado nas eliminat??rias (que contava com B??lgica e S??rvia) e pela respecagem europeia (batendo a Isl??ndia). Mas h?? males que vem para o bem e agora o time desembarca no Brasil bem mais experiente e testado, al??m de estar "fechado" com o treinador Niko Kovac.
9	Mexico	Depois de muito suar, o M??xico se garantiu na Copa do Mundo na repescagem, com duas boas vit??rias sobre a Nova Zel??ndia, mas precisa evoluir bastante. E quem disse isso foi o pr??prio treinador de "La Verde", Miguel Herrera:\n"Sim, n??s precisamos melhorar muito mais para a Copa do Mundo. Precisamos melhorar e temos consci??ncia disso, porque sabemos que o n??vel na Copa ?? bem maior. Vamos ter que trabalhar muito para evoluir, sem d??vidas".\nAl??m de ter ido mal nas Eliminat??rias, o time tamb??m n??o foi bem na Copa das Confedera????es, passou por muitas trocas no comando e conflitos entre comiss??o t??cnica e jogadores. Somando isso a uma postura defensiva bem fraca - que beira a irresponsabilidade -, o M??xico vai precisar de muita sorte para n??o quebrar uma sequencia de cinco participa????es nas oitavas de final. Atualmente oa Aztecas s??o o pior time do Grupo A.
26	Camaroes	?? o mais tradicional representante da ??frica e, das ??ltimas seis Copas, Camar??es pintou em cinco (ficou fora em 2006). ?? bem verdade que o encanto de 1990 nunca mais se repetiu, mas a equipe que vem ao Brasil ?? encardida. \nEtoo, claro, ?? o destaque. Mas Assou-Ekoto, MBia, Emana, Matip e Song ajudam muito a estrela do Chelsea. At?? porque, depois de abandonar a equipe o atacante n??o tem a moral que j?? teve no passado e tem at?? junho para reconquistar o grupo. \nAo cont??rio do estere??tipo irrespons??vel dos times do continente, este Camar??es ?? equilibrado e cauteloso. Se conseguir tapar algns buracos no meio e nas laterais, tem tudo para fazer uma boa campanha.
8	Espanha	Vivendo a pior fase da hist??ria recente, a F??ria deveria agradecer aos c??us pelo fato da Copa ser apenas em junho. Com os seus principais jogadores em baixa ou contundidos, Vicente del Bosque j?? passou por momentos mais tranquilos. Titular do Real Madrid apenas na Liga dos Campe??es, Casillas n??o tem mais o mesmo prest??gio de outrora e passa a ter a titularidade amea??ada por Victor Vald??s, que vive seu melhor momento. No meio-campo, Xavi vem sentindo o peso dos 33 anos e come??a a ser menos participativo na cria????o das jogadas, sobrecarregando Iniesta e David Silva. \nPor??m, a grande preocupa????o dos espanh??is fica no ataque. Sem um camisa 9 para chamar de seu, a Espanha precisou "contratar" o brasileiro Diego Costa, artilheiro do Atl??tico de Madrid, para tentar resolver a falta de gols de seus homens de frente. Faro de gol ele tem, mas ser?? que o seu estilo vai combinar com o tiki-taka?
18	Holanda	No pr??ximo m??s de junho, a Holanda vai trazer a ??ltima marcha de medalh??es que ter?? a miss??o de guiar um time em forma????o: Sneijder, Robben, Kuyt, Nigel De Jong, Huntelaar e Robin van Persie. O ??ltimo, inclusive, foi artilheiro das Eliminat??rias, com 12 gols.\nNo entanto, o intoc??vel 4-3-3 holand??s vai trazer novos nomes e provavelmente alguns desses talentos v??o estar em gigantes europeus ap??s o Mundial. Leroy Fer, Adan Maher, Jeremain Lens, Luciano Narsingh e Memphis Depay... S??o tantas op????es que o t??cnico Louis van Gaal deve cometer algumas injusti??as. \nO pa??s vem ao Brasil com grandes jogadores, mas um time em forma????o nos deixa ainda mais incertos do que vai acontecer, ainda mais se tratando de Holanda. A equipe pode voar baixo, ser eficiente, tremer em alguma fase... O que esperar da Laranja Mec??nica?
20	Chile	O Chile chega a Copa com um respeito nunca antes visto na hist??ria dessa competi????o. Com o diferenciado Alexis S??nchez vivendo seu melhor momento no Barcelona, o time alia qualidade individual a um esquema de jogo ofensivo e bem interessante. Ap??s fazer um trabalho excepcional na Universidad de Chile, o comandante Jorge Sampaoli vem se mostrando um substituto ?? altura de Marcelo "Loco" Bielsa.\nO treinador perdeu em sua estreia ?? frente da Roja (1 a 0 para o Peru), mas logo deu sua cara ?? equipe e engatou uma sequ??ncia arrasadora, com treze jogos de invencibilidade. Destaque para as vit??rias sobre Uruguai e Inglaterra, al??m de um empate diante da campe?? mundial Espanha. A s??rie s?? foi quebrada no ??ltimo amistoso com a Sele????o Brasileira, que venceu por 2 a 1 em Toronto. Nada que tire a confian??a do belo time chileno, que, al??m de S??nchez, se apoia no juventino Vidal para ir longe. 
32	Grecia	Sem muita tradi????o em Copas do Mundo, a Gr??cia chega no mundial com a esperan??a de, finalmente, fazer bonito e passar de fase. O Navio Pirata ir?? apenas para a terceira participa????o, n??o tendo nunca passado da fase de grupos, mas chega embalada ap??s boa campanha nas eliminat??rias e vit??rias convincentes contra a Rom??nia nos playoffs.\nMesmo com bons nomes, como Sokratis, o eterno Karagounis e Samaras, a grande esperan??a grega est?? nos p??s do artilheiro Mitroglou, que vive excelente fase e pode ser o diferencial da sele????o. 
29	Honduras	A sele????o hondurenha vai para sua terceira Copa do Mundo ap??s uma boa campanha nas Eliminat??rias da CONCACAF, que for??ou o bicho-pap??o do continente, o M??xico, a disputar a repescagem. N??o tem nomes muito badalados e n??o vai contar com David Suazo e Julio C??sar De Le??n, seus principais jogadores no passado recente, mas vai buscar surpreender no mundial.\nAs principais esperan??as s??o depositadas em Jerry Bengtson, Wilson Palacios e Maynor Figueroa, al??m do experiente goleiro Noel Valladares. O amistoso recente contra o Brasil mostrou que a sele????o n??o est?? a altura de competir com as principais favoritas e se marcar um ponto j?? vai sair no lucro. 
24	Australia	Garantida em sua terceira Copa do Mundo consecutiva (e apenas a quarta em sua hist??ria), a Austr??lia passou sem grandes sustos pelas Eliminat??rias da ??sia - confedera????o da qual faz parte desde 2006. No entanto, mesmo com a vaga j?? carimbada, a coisa desandou e o t??cnico Holger Osieck acabou demitido ap??s uma sequ??ncia desastrosa. Derrotas para Jap??o e China, e humilhantes goleadas de 6 a 0 para Brasil e Fran??a. Com a Copa chegando, algo precisava ser feito. \nA Federa????o Australiana de Futebol apostou em Ange Postecoglou, jovem treinador que vinha fazendo sucesso no campeonato local. A resposta da equipe foi imediata, com o eterno Tim Cahill fazendo o ??nico gol da vit??ria sobre a Costa Rica. O primeiro objetivo de  Postecoglou ?? come??ar a reformular a j?? envelhecida equipe, pois al??m de n??o fazer feio na Copa do Mundo o time tamb??m ter?? que se sair bem na Copa da ??sia de 2015, a ser sediada em casa.
12	Colombia	As esperan??as do povo colombiano para a Copa est??o l?? nas alturas. Ainda mais altas que os morros de Bogot??. ?? cedo para falar se o time de Jos?? Pekerman vai superar a memor??vel equipe de 1994, que contava com Rinc??n, Valencia e Valderrama, mas h?? uma qualidade invej??vel no grupo.\nNo gol, Faryd Mondragon pode ser o jogador mais velho a disputar uma Copa do Mundo, com 43 anos, caso tome a vaga do titular David Ospina. A defesa conta com o tamb??m experiente Yepes, mas h?? lugar para os jovens e promissores Arias e Medina disputarem uma vaga. Do meio para frente a coisa melhora muito e o time explora bastante os flancos com Cuadrado e Armero, mas sem perder a qualidade no setor mais central com Guarin. Mais avan??ados, James Rodriguez, Falcao Garc??a e Jackson Mart??nez formam um trio de bastante respeito.\nA qualidade t??cnica impressiona, mas Pekerman ter?? que ter muito cuidado para segurar o ??mpeto naturalmente ofensivo da equipe. Se todo mundo partir para o ataque e n??o ficar de olho na retaguarda poderemos ver uma bela sele????o dando adeus de forma dolorosa.
25	Costa do Marfim	Os Elefantes da Costa do Marfim j?? n??o podem mais serem tachados como surpresa. A equipe ?? hoje uma das principais sele????es da ??frica. E se nas duas Copas em que participou (2006 e 2010) eles n??o conseguiram passar da primeira fase (vale lembrar que ca??ram as duas vezes no "grupo da morte"), dessa vez a hist??ria pode ser diferente.\nO time do treinador franc??s Sabri Lamouchi tem pe??as important??ssimas. Muitos de seus principais jogadores atuam nas grandes equipes da europa - caso de Didier Drogba, Kolo e Yaya Tour??, Ebou??, Kalou...\nOs marfinenses contam ainda com Gervinho, ex-jogador do Arsenal e que vem fazendo uma temporada acima da m??dia com a camisa da Roma. Vale lembrar que muitos desses jogadores j?? passaram da casa dos 30 anos de idade e devem ter sua ??ltima grande oportunidade de brilhar em uma Copa do Mundo. Sinal de que os elefantes chegar??o com fome de bola ao Brasil.
23	Japao	O Jap??o chega ao quinto Mundial de sua hist??ria vivendo o melhor momento do futebol do pa??s. Contando com o talento dos meias Honda e Kagawa e criando disciplina t??tica, a sele????o deve causar problemas. Na ??ltima Copa das Confedera????es, a equipe perdeu os tr??s jogos que disputou, contra Brasil, It??lia e M??xico, mas deixou o torneio de cabe??a erguida, j?? que jogou de igual para igual em todas as partidas.\nRecentemente, os nip??nicos visitaram a badalada sele????o da B??lgica e conquistaram uma bela vit??ria por 3x2, em Bruxelas. Os asi??ticos chegam dispostos a surpreender os favoritos e superar o desempenho na ??ltima edi????o do torneio, quando foram eliminados pelo Paraguai nas oitavas de final. 
5	Uruguai	Atuais campe??es da Am??rica e semifinalistas em 2010, os uruguaios sofreram mais do que esperavam para confirmar um lugar na Copa. A vaga s?? veio na repescagem, diante da fragil??ssima Jord??nia. Mas a sensa????o para ao sul do Rio Grande do Sul ?? de que o pior j?? passou. O time celeste aposta na m??stica do Maracanazo para repetir o feito de 1950 e chegar ao topo do mundo. Mais que bons agouros, os uruguaios tamb??m contam com um time que tem condi????es de chegar l??.\nCavani e Su??rez formam provavelmente a melhor dupla de ataque entre todas as 32 sele????es da Copa. Dif??cil de segurar. Forl??n, maior artilheiro da hist??ria da Celeste, ?? uma bel??ssima op????o para ??scar Tab??rez. O problema segue sendo a falta de equil??brio entre o setor ofensivo e o resto do time. Mas se engana quem pensa que o resto do time ?? fraco. O zagueiro Diego God??n, por exemplo, vive grande momento no Atl??tico de Madrid. O sonho de repetir 1950 est?? vivo como nunca.
28	Costa Rica	A Costa Rica est?? muito empolgada com a ??tima participa????o da sele????o tica nas Eliminat??rias. Depois de jogar mal na terceira fase (quando perdeu as duas para o M??xico e passou sufoco contra El Salvador), a equipe treinada pelo colombiano Jorge Lu??s Pinto evoluiu e se classificou sem sustos no hexagonal final da Concacaf. Com direito a quase eliminar os rivais mexicanos na ??ltima rodada.\nA Costa Rica quase sempre ?? armada em um 5-4-1 para fortalecer o sistema defensivo do time, que ?? ruim, lento e d?? muito espa??o, principalmente ?? frente da ??rea. Mas, o que falta atr??s sobra na frente, com os experientes Bryan Ruiz, Cristian Bola??os e ??lvaro Saborio dando suporte ao ??timo garoto Joel Campbell. Se os advers??rios n??o tomarem conta deste ataque, a Costa Rica podem perder pontos preciosos na briga pela classifica????o, al??m de tomar um preju??zo no saldo de gols.
6	Inglaterra	Sempre se espera muito dos ingleses, que historicamente mostraram ser apenas uma sele????o decente. Segundo dados estat??sticos do excelente livro Soccernomics, a Inglaterra entre 1970 e 2007 venceu 67,4% das suas partidas ou seja: dois ter??os de tr??s partidas. O livro confirma tamb??m que a sele????o ?? constante, logo uma boa sele????o que costuma se sair melhor do que as outras boas. No entanto, isso n??o ?? necess??rio para ser transformado em t??tulos, em ser a melhor da Copa do Mundo, por exemplo.\nJoe Hart ?? um goleiro de ??timos reflexos, mas n??o vive bom momento. Os laterais Glen Johnson, Walker, Baines e Ashley Cole seriam titulares em v??rias sele????es do mundo. Jagielka e Cahil s??o dois bons zagueiros. N??o se discute a t??cnica de Gerrard, Lampard e Carrick ou o potencial de Barkley. No entanto, os tr??s primeiros (que s??o titulares) podem pecar pela falta de velocidade.\nTownsend, do Tottenham, ?? uma grata surpresa neste ano de 2013 e ser?? muito ??til pelos lados do campo. Walcott, que retornou de les??o recentemente, tamb??m. Rooney, por fim, ?? o jogador que mais pode fazer a diferan??a e as esperan??as est??o depositadas no Shrek. Sturridge est?? em excelente fase no Liverpool, mas as atua????es pela Inglaterra n??o correspondem ??s expectativas do seu faro de gol no Campeonato Ingl??s. \nPara completar, o English Team caiu no Grupo da Morte da Copa. A classifica????o n??o ser?? uma surpresa para a boa, mas imprevis??vel sele????o de Roy Hodgson. A elimina????o precoce tamb??m n??o.
2	Italia	Embora a Copa das Confedera????es tenha deixado uma boa impress??o da sele????o italiana, um clima de incerteza ronda a Squadra Azzurra a alguns meses da Copa do Mundo e ?? muito dif??cil prever o desempenho de um time que sempre muda de postura no meio da competi????o. Como disse o lend??rio goleiro Buffon: "A It??lia sempre surpreende, seja para o bem ou para o mal".\nSe a Copa fosse hoje, 80% do elenco italiano estaria fechado e o time titular praticamente definido, mas a lateral-esquerda e o ataque ainda s??o zonas nebulosas. Prandelli cogitou at?? mesmo o retorno de Totti, mas mudou de ideia e descartou o capit??o da Roma. Giuseppe Rossi e Balotelli seria uma ??tima dupla de ataque e, provavelmente, ser?? a escolha do treinador, mas o primeiro sofre muitas les??es e o segundo tem um temperamento extremamente vol??til.\nPode parecer um absurdo, mas foi bom a It??lia cair em um grupo t??o dif??cil. Historicamente o pa??s se comporta melhor quando enfrenta grandes advers??rios, e ter dois grandes desafios logo de cara vai fazer com que os jogadores estejam focados desde o primeiro minuto. 
11	Suica	Se a Copa fosse hoje... ?? o que devem pensar diariamente muitos su????os que veem atualmente a mais forte sele????o su????a dos ??ltimos 50 anos. A equipe treinada pelo ??timo alem??o Ottmar Hitzfeld mostrou isso dominando completamente seu (fraco) grupo nas eliminat??rias, conquistando sete vit??rias e tr??s empates. Al??m disso, o bom desempenho em amistosos (vit??rias sobre Alemanha, Brasil e Cro??cia desde 2012) deram ?? Su????a a inimagin??vel condi????o de cabe??a-de-chave.\nA fort??ssima defesa que bateu o recorde de invencibilidade em Copas do Mundo em 2006 e 2010 j?? n??o ?? t??o impenetr??vel assim (embora tenha tomado apenas seis gols em dez gols nas eliminat??rias, quatro em um mesmo jogo, da Isl??ndia!). Mas isso ?? bom, pois representa que os su????os t??m mais talento e t??m buscado produzir mais com a bola. \nOs volantes Inler e Behrami levam o entrosamento do Napoli, protegendo a zaga Von Bergen e Djourou e chegando forte ?? frente. Na linha de meias, muita qualidade com os jovens Shaqiri, Xhaka, Stocker e Mehmedi. Na frente, Seferovic parece estar pronto para assumir os gols. Al??m disso, ainda tem boas op????es de banco como Gelson Fernandes, Barnetta, Dzemaili e Derdiyok. N??o ?? absurdo, no melhor cen??rio, pensar na Su????a repetindo uma quartas-de-final, seu melhor resultado em Copas (1934, 1938 e 1954).
13	Equador	De volta a Copa do Mundo ap??s ficar ausente em 2010, o Equador chega como franco atirador. O time fez uma campanha regular nas Eliminat??rias e, assim como aconteceu antes das Copas de 2002 e 2006, garantiu sua vaga no Mundial com um ??timo retrospecto caseiro, sem sofrer nenhuma derrota em seus dom??nios. Mas, para a infelicidade de "La Tri", nenhuma cidade-sede da nossa Copa fica em regi??es muito acima do n??vel do mar, onde o seu futebol ?? bem difrente.\nFelipe Caicedo ?? um bom ataque e o incans??vel capit??o Antonio Valencia d?? um pouco de consist??ncia ao meio-campo, mas ?? muito pouco. Al??m disso, o time perdeu um de seus bons atacantes, Christian Benitez, que morreu em julho. 
7	Franca	Por muito pouco a Fran??a n??o teve que assistir a Copa do Mundo pela TV. A Ucr??nia deu um susto do tamanha da Torre Eiffel na repescagem, mas o time de Didier Deschamps conseguiu reverter uma derrota de 2 a 0 e com certeza ganhou moral para o Mundial.\nColetivamente a equipe ainda n??o rendeu tudo o que podia, mas se for feita uma an??lise individual dos principais talentos, o time tem alguns dos atletas que mais evolu??ram nos ??ltimos anos. Rib??ry sempre foi um bom jogador, mas agora vive o auge. Giroud ganha cada vez mais confian??a a medida em que faz gols no Arsenal e na sele????o briga forte com Benzema por uma vaga no ataque. Por fim, a juventude de Varane e Pogba, que completaram 20 anos h?? pouco mas j?? s??o titulares dos gigantes Real Madrid e Juventus. Se Deschamps aproveitar o tempo que tem pela frente para conseguir "dar liga" ao time, a Fran??a pode ir longe.
4	Argentina	Engana-se quem olha para o time como Messi e mais dez. De fato, ter o melhor do mundo ajuda. E muito. Mas a Argentina de Alejandro Sabella passa longe da equipe de 1986, que era amparada somente em Maradona. O protagonista de agora tem coadjuvantes mais fortes.\n Sabella tem Di Maria e Aguero em ??tima forma. Higua??n foi vice-artilheiro das Eliminat??rias e recuperou a confian??a ao trocar o Real Madrid pelo Napoli. O elenco ?? t??o forte no setor ofensivo que pode se dar ao luxo de n??o contar com Carlos T??vez. Na retaguarda, Mascherano ?? cada vez mais l??der de uma defesa que vai se arrumando (foi a segunda melhor das Eliminat??rias).
31	Bosnia Herzegovina	A B??snia fez hist??ria ao unir um pa??s e garantir sua primeira competi????o da hist??ria. A estreante em Copas ainda contou com a sorte no sorteio e tem grandes chances de avan??ar ?? fase de mata-mata.\nApesar dos 30 gols feitos na Fase de Grupos das Eliminat??rias, o time n??o teve de enfrentar nenhum gigante no seu caminho. Os dois maiores eram a Gr??cia e Eslov??quia. Mesmo assim, a dupla de ataque Ibisevic e Dzeko acabou com a disputa e juntos eles marcaram 18 gols.\nO pa??s ainda conta com outros bons jogadores. O experiente camisa 10, Misimovic, mostra que pode ser ??til ao t??cnico Susic. O capit??o Spahic, que joga pelo Bayer Leverkusen, ?? a refer??ncia do inexperiente setor defensivo. Voltando ao meio-campo outros dois bons nomes s??o Pjanic, da Roma, e Lulic, da Lazio, que tamb??m pode jogar na lateral.\nO que pode pesar contra a equipe ?? a falta de exper??ncia. Nos ??ltimos amistosos, contra Argentina, Estados Unidos, Eslov??nia, Arg??lia, Pa??s de Gales, M??xico, Irlanda e Brasil, foram tr??s vit??rias, mas nenhuma delas foi contra pa??ses que v??o estar na Copa. Uma das derrotas foi para a Argentina. 
21	Ira	A sele????o iraniana aparece vez ou outra na Copa do Mundo. A ??ltima vez foi em 2006, quando foi eliminada ainda na primeira fase com apenas um ponto conquistado. Por outro lado, o time do t??cnico portugu??s Carlos Queiroz chega embalado ao Brasil. Os iranianos venceram a tradicional sele????o da Cor??ia do Sul na ??ltima rodada das eliminat??rias por 1 a 0 e garantiram a vaga com a primeira coloca????o do grupo asi??tico. \nAs esperan??as de uma campanha que os leve at?? as oitavas de final est??o depositadas nos gols do artilheiro Reza Ghoochannejhad, que divide o protagonismo do time com experiente Javad Nekounam, principal armador de jogadas da equipe. Se esses dois n??o estiverem em um bom dia a coisa fica preta...
15	Nigeria	As Super ??guias chegam ao seu quinto Mundial dispostas a apagar a p??ssima campanha no Mundial da ??frica do Sul, quando somaram apenas um ponto e terminaram na lanterna do seu grupo. Mas, apesar de credenciada pelo t??tulo da Copa Africana das Na????es e por uma participa????o honrosa na ??ltima Copa das Confedera????es, os nigerianos nem de longe lembram a equipe que encantou o mundo na d??cada de 1990.\nCom um time renovado e bastante jovem, a Nig??ria tem em Obi Mikel e Moses as principais esperan??as para tentar alguma coisa. Um fator preocupante s??o os problemas de relacionamento entre os jogadores e a federa????o, que quase deixaram o time fora da Copa das Confedera????es. 
3	Alemanha	A tricampe?? mundial sempre chega ?? Copa do Mundo como uma das favoritas. Mas dessa vez pode-se dizer que esse favoritismo ?? ainda maior. Com um elenco jovem e muito promissor, a equipe de Joachim L??w tem a base das duas equipes que disputaram o t??tulo da Liga dos Campe??es na ??ltima temporada.\nJogadores da nova safra como ??zil, G??tze, Reus, Thomas M??ller, Sch??rrle e Draxler, jogam ao lado dos mais experientes Philipp Lahm, Schweinsteiger, Podolski, Mario Gomez e Klose - que pode se tornar o maior artilheiro de todas as Copas do Mundo, ultrapassando Ronaldo.\nNas eliminat??rias, uma campanha impec??vel garantiu a lideran??a de seu grupo. Os alem??es se classificaram invictos, conquistando 9 vit??rias e 1 empate em 10 jogos no per??odo pr??-Copa. \nMas nem tudo s??o flores. L??w pode encontrar problemas para armar o meio-campo da equipe, principalmente na prote????o ?? zaga. Schweinsteiger e Khedira sofreram les??es graves e a previs??o ?? de que s?? retornem num per??odo bem pr??ximo ao in??cio dos jogos. Para cumprir esse papel, o treinador pode contar ainda com Gundogan, Toni Kroos, e os irm??os (Sven e Lars) Bender. 
19	Portugal	O maior trunfo de Portugal na Copa do Mundo ?? tamb??m seu maior problema. Cristiano Ronaldo mostrou que sua fase exuberante n??o est?? a servi??o apenas do Real Madrid e carregou o pa??s nas costas para garantir a vaga diante da Su??cia. Prov??vel melhor do mundo em 2013, ele hoje teria plena condi????es de passar por cima de qualquer advers??rio e dar o primeiro t??tulo mundial aos patr??cios.\nA quest??o ?? que, no alt??ssimo n??vel de uma Copa, ?? dif??cil algu??m resolver sozinho. Rom??rio, em 1994, e Maradona, em 1986, foram protagonistas destacad??ssimos, mas tinham por tr??s equipes que funcionavam. Cristiano Ronaldo sofre com a falta de coadjuvantes de peso. O talentoso Jo??o Moutinho e o xerif??o Pepe s??o belos nomes, mas, no geral, o time de Paulo Bento n??o ?? nada consistente. ?? bola no craque e - ai, Jesus! - seja o que Deus quiser. 
27	Gana	As chances de Gana surpreender s??o grandes. O jovem elenco que foi parado nos p??naltis pelo Uruguai nas quartas de final da Copa do Mundo de 2010 est?? mais maduro. Nas Eliminat??rias, Gana venceu cinco das seis partidas da fase de grupos e passou sem dificuldades. O Egito tentou desafiar as Estrelas Negras no mata-mata, por??m n??o aguentou o tranco. No primeiro jogo, um acachapante seis a um e a volta foi s?? para cumprir tabela e ver o cara do time, Kevin-Prince Boateng, deixar sua marca.\nAl??m do camisa 9 do Schalke 04, o time conta com muitos outros bons nomes. Inkoom ?? o lateral que leva o time ao ataque com alta velocidade. O quarteto que pode atuar na meio impressiona: o seguro Essien, do Chelsea, o motorzinho da marca????o Muntari, do Milan, o veloz Asamoah, da Juventus, e o j?? comentado Boateng garantem tranquilidade ao treinador Akwasi Appiah. O ataque tamb??m traz boas op????es: o artilheiro Asamoah Gyan, atual capit??o, lidera a negra estrela da ??frica. Ao seu lado podem jogar os irm??os Ayew, do Olympique de Marseille.\nO setor defensivo ?? o menos forte. N??o existe uma refer??ncia na marca????o desde Samuel Kuffour. Portanto, vai sobrar disposi????o para evitar que a bola entre e muita t??cnica e correria para balan??ar a rede l?? na frente.
14	Estados Unidos	Na d??cima Copa do Mundo da sua hist??ria, s??tima seguida, os americanos chegam ao Brasil dispostos a mostrar que n??o entendem apenas de futebol com bola oval. Pot??ncia em todas as modalidades esportivas, os Estados Unidos ainda caminham devagar quando o assunto ?? o soccer.\nTreinados pela lenda alem?? J??rgen Klinsmann, campe??o da competi????o em 1990, e com uma liga profissional que cresce em ritmo alucinante gra??as a craques consagrados como Thierry Henry, os sobrinhos do Tio Sam prometem incomodar em 2014. Dentro das quatro linhas, as esperan??as ficam nos p??s do capit??o Dempsey, do atacante Altidore e do experiente Landon Donovan, maior goleador da hist??ria da sele????o.\nAl??m do sorteio ter sido ingrato pelos advers??rios, os norte-americanos tamb??m tem outro motivo para reclamar: a equipe far?? jogos em Natal, Manaus e Recife, o que significa que vai ser a sele????o que mais quilometros vai percorrer na primeira fase. O desgaste pode pesar. 
30	Belgica	A B??lgica est?? nos holofotes da imprensa mundial e tudo leva a crer que continuar?? estando em junho de 2014. A aclamada "gera????o belga" classificou a sele????o para um Mundial (ap??s dois torneios de aus??ncia) com v??rios jogadores de muito potencial: Courtois, Mignolet, Kompany, Vertonghen, Fellaini, Witsel, Hazard, De Bruyne, Lukaku, Benteke, entre outros.  Mas eles desembarcar??o no Brasil com o status de cabe??a-de-chave e com uma press??o grande para ir longe na competi????o. A?? pode estar o problema...\n?? indiscut??vel que a B??lgica tem muito talento e jogadores acostumados a grandes jogos, v??rios deles no melhor campeonato nacional do mundo, o Ingl??s. S?? que eles v??o precisar mostrar que est??o prontos para render de cara em uma Copa do Mundo, reconhecidamente uma competi????o "diferente". Se isso acontecer, a B??lgica pode sim ir longe. Mas caso eles n??o virem essa chave, n??o acho imposs??vel os belgas serem a grande decep????o do torneio. Outra quest??o: o time ?? muito competitivo, mas est?? longe de jogar um futebol "bonito de se ver" e com grande volume. Com esse cartaz todo, ser?? um desafio produzir contra equipes retrancadas. 
16	Argelia	A Arg??lia chegou na Copa do Mundo ap??s um disputado playoff final contra Burkina Faso, passando por conta dos gols feitos fora de casa. Na ??ltima partida, a torcida argelina lotou o est??dio e sete horas antes do jogo come??ar n??o havia mais lugar vago, o que motivou as Raposas do Deserto a alcan??ar o objetivo maior.\nLonge de estar entre as favoritas, as Raposas ter??o que confiar em Bougherra, Yebda e Feghouli para ter alguma chance, mas a fraqueza de op????es ser?? um problema. A Arg??lia pode se inspirar na sele????o de 82, que s?? n??o passou de fase por conta do saldo de gols e inclusive bateu a poderosa Alemanha na fase de grupos, mas muito provavelmente o time de hoje n??o passar?? da primeira fase.
17	Russia	A R??ssia chega a Copa pensando em se recuperar dos vexames recentes. Dos ??ltimos seis mundiais, os russos n??o se classificaram em tr??s (1998, 2006 e 2010) e foram eliminados na primeira fase nas outras tr??s (em 1990 ainda como Uni??o Sovi??tica). Treinada por Fabio Capello desde julho de 2012, a equipe chamou a aten????o por ter conseguido se classificar de forma segura no grupo que tinha Portugal.\nCapello formou uma sele????o experiente, com v??rios jogadores que se acostumaram a disputar competi????es europeias pelo Zenit e pelo CSKA. O goleiro Akinfeev ?? bom, mas j?? inspirou mais confian??a. A defesa ?? muito forte fisicamente e segura. O meio-campo sofre um pouco para criar. E o ataque vem dando conta do recado com o artilheiro Kezhakov (est?? a tr??s gols de se tornar o maior artilheiro russo). Sem d??vida ?? um trabalho para conseguir passar da primeira fase.
22	Coreia do Sul	A Coreia do Sul vai para a sua oitava Copa do Mundo seguida. Mas j?? viveu dias melhores. A classifica????o n??o foi tranquila e o time demorou para encaixar. Ji Dong-Won, do Sunderland, ?? a refer??ncia na frente. No meio, o capit??o Lee Chung-Yong e o promissor Son Heung-Min, do Bayer Leverkusen, t??m sido os destaques. \n No geral, a Coreia pinta como um advers??rio que, dentre os considerados mais fracos, ningu??m quer pegar. Dif??cil dizer que pode tirar B??lgica ou R??ssia, mas vai exigir o melhor de seus advers??rios. 
\.


--
-- Name: times_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('times_id_seq', 33, true);


--
-- Name: pk_cidades; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cidades
    ADD CONSTRAINT pk_cidades PRIMARY KEY (id);


--
-- Name: pk_grupos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT pk_grupos PRIMARY KEY (id);


--
-- Name: pk_grupostimes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupos_times
    ADD CONSTRAINT pk_grupostimes PRIMARY KEY (idgrupo, idtime);


--
-- Name: pk_times; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY times
    ADD CONSTRAINT pk_times PRIMARY KEY (id);


--
-- Name: idx_grupos_nome; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_grupos_nome ON grupos USING btree (nome);


--
-- Name: fk_grupos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupos_times
    ADD CONSTRAINT fk_grupos FOREIGN KEY (idgrupo) REFERENCES grupos(id);


--
-- Name: fk_times; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupos_times
    ADD CONSTRAINT fk_times FOREIGN KEY (idtime) REFERENCES times(id);



