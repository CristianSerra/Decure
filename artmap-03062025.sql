-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: artmap.mysql.dbaas.com.br
-- Generation Time: 03-Jun-2025 às 01:12
-- Versão do servidor: 5.7.32-35-log
-- PHP Version: 5.6.40-0+deb8u12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `artmap`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `filtro`
--

CREATE TABLE `filtro` (
  `id` int(11) NOT NULL,
  `imagem` varchar(150) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `contato` varchar(200) NOT NULL,
  `agendamento` varchar(200) NOT NULL,
  `link` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `homepage`
--

CREATE TABLE `homepage` (
  `id` int(11) NOT NULL,
  `Titulo` varchar(150) NOT NULL,
  `Instituicao` varchar(150) NOT NULL,
  `imagem` varchar(50) NOT NULL,
  `descricao` varchar(3000) NOT NULL,
  `link` varchar(150) NOT NULL,
  `LinkPost` varchar(150) NOT NULL,
  `Instagram` varchar(120) NOT NULL,
  `Endereco` varchar(500) NOT NULL,
  `Contato` varchar(150) NOT NULL,
  `Agendamento` varchar(150) NOT NULL,
  `Horario` varchar(2000) NOT NULL,
  `DataPub` date NOT NULL,
  `DataFim` date NOT NULL,
  `TAGS` varchar(200) NOT NULL,
  `categoria` varchar(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `homepage`
--

INSERT INTO `homepage` (`id`, `Titulo`, `Instituicao`, `imagem`, `descricao`, `link`, `LinkPost`, `Instagram`, `Endereco`, `Contato`, `Agendamento`, `Horario`, `DataPub`, `DataFim`, `TAGS`, `categoria`) VALUES
(1, '', '', 'banner1.png', 'Notre-Dame de Paris - MIS Experience', 'misexperience.org.br', '', '', '', '', '', '', '2024-09-26', '0000-00-00', '', '0'),
(2, '', '', 'banner2.png', 'Línguas Africanas - Museu da Língua Portuguesa', 'www.museudalinguaportuguesa.org.br', '', '', '', '', '', '', '2024-09-25', '0000-00-00', '', '0'),
(3, '', '', 'banner3.png', 'O cinema de Billy Weider - MIS Jardim Europa', 'mis-sp.org.br', '', '', '', '', '', '', '2024-09-23', '0000-00-00', '', '0'),
(4, 'Últimas semanas para visitar a exposição ‘Catherine Opie: o gênero do retrato’', 'MASP - Museu de Arte de São Paulo', 'catherine.png', 'Últimas semanas para visitar a exposição ‘Catherine Opie: o gênero do retrato’\n\nA mostra apresenta 66 fotografias realizadas entre 1987 e 2022. O subtítulo da exposição alude aos diferentes significados em português da palavra gênero, em oposição ao inglês ‘gender/genre’.\n\nPor um lado, o gênero [genre em inglês] é o tipo, a espécie, a forma, a classe, a categoria, o estilo; no campo das artes visuais, podemos falar em diferentes gêneros na pintura: o retrato, a paisagem, a natureza morta.\n\nPor outro lado, o gênero [gender em inglês] é também a diferença socialmente construída entre homens e mulheres ou aqueles que se identificam de outros modos, e pode abarcar diversas identidades, sejam elas transgêneras, não-binárias ou cisgêneras. Opie se apropria do gênero tradicional do retrato, associado normalmente às elites, para dar visibilidade e força a sua própria comunidade.\n\n‘Catherine Opie: o gênero do retrato’, em cartaz de 5.7 a 27.10.2024, é curada por Adriano Pedrosa, diretor artístico, e Guilherme Giufrida, curador assistente.', 'https://www.masp.org.br/', 'https://www.instagram.com/p/DBT3P5yTkUE/?img_index=1', '@masp', 'Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200', 'https://www.masp.org.br/sobre/fale-conosco', 'http://masp.org.br/ingressos', 'TERÇA: 10H – 20H (ENTRADA ATÉ AS 19H)\nQUARTA – DOMINGO: 10H – 18H (ENTRADA ATÉ AS 17H)\nSEGUNDA: FECHADO', '2024-10-19', '2024-10-27', 'Fotografia,Retrato,Identidade de gênero,Catherine Opie,Adriano Pedrosa,Guilherme Giufrida,Pintura de retrato,LGBTQIA+', 'EX'),
(5, 'Conversa com Vânia Mignone e Lilia Schwarcz', 'Casa Triângulo', 'vania.jpg', 'Conversa com Vânia Mignone e Lilia Schwarcz . Sábado 19.10.2024 às 12h.\n\nVânia Mignone: A Esperança Equilibrista . Exposição individual . Ensaio crítico de Lilia Schwarcz . 21.09.2024 - 01.11.2024 .', 'https://www.casatriangulo.com/pt/', 'https://www.instagram.com/p/DBRR4t9RS3J/', '@casatriangulo', 'Rua Estados Unidos 1324 - CEP 01427-001 - São Paulo', 'T: +55 11 3167-5621 / INFO@CASATRIANGULO.COM', '', '\n\nDE SEGUNDA A SEXTA / DAS 10H ÀS 19H / SÁBADO / DAS 10H ÀS 17H', '2024-10-18', '2024-11-01', 'Vânia Mignone,Lilia Schwarcz,Exposição individual,A Esperança Equilibrista,Conversa sobre arte', 'EX'),
(6, '‘Mucki Botkay: janelas imaginárias’ segue aberta para visitação até 16 de janeiro na Galatea Salvador.', 'Galatea', 'galatea.jpg', '‘Mucki Botkay: janelas imaginárias’ segue aberta para visitação até 16 de janeiro na Galatea Salvador.\n\nA artista carioca Mucki Botkay apresenta pela primeira vez as suas pinturas com miçangas em uma grande exposição individual. As obras exploram formas e cores presentes em diversos ecossistemas dentro da Mata Atlântica, como manguezais, lagunas e restingas. Criando composições que por vezes remetem a mestres da tapeçaria como Genaro de Carvalho e Roberto Burle Marx, Mucki não só reencena a natureza, como também estica a figuração de modo a flertar com abstração.\n\nA exposição conta com texto crítico assinado por Leonel Kaz, curador que tem acompanhado a produção da artista nos últimos anos.', 'https://galatea.art/', 'https://www.instagram.com/p/DBR6GY9PN7M/?img_index=1', '@galatea.art_', 'Galatea São Paulo\nR. Oscar Freire, 379 – Lj. 1 \n01426-900 | Jardins\n\nRua Padre João Manuel, 808\n01411-0001 | Jardins\n\nGALATEA salvador\nR. Chile, 22\n40026-032 ', 'Galatea São Paulo\n\ncontato@galatea.art\n\n+ 55 11  3475 0099\n\nGalatea Salvador\n\nsalvador@galatea.art\n\n+ 55 71  35110046', 'Não necessário', 'GALATEA são paulo\n\nR. Oscar Freire, 379\nHorário de funcionamento:\n\nterça – quinta | 10 às 19h\n\nsexta | 10 às 18h\n\nSábado | 11h às 17h\n\n–\n \nRua Padre João Manuel, 808\nHorário de funcionamento:\n\nsegunda – quinta | 10 às 19h\n\nsexta | 10 às 18h\n\nSábado | 11h às 17h\n\n\nGALATEA salvador\nR. Chile, 22\n\nHorário de funcionamento:\n\nterça – quinta | 10 às 19h\n\nsexta | 10 às 18h\n\nSábado | 11h às 15h', '0000-00-00', '2025-01-16', 'Mucki Botkay,Abstração,Arte Têxtil,Mata Atlântica,Figuração', 'GA'),
(7, 'Vem aí: 15ª Bienal Internacional de Arte Contemporânea de Curitiba. ', 'Bienal Internacional de Arte Contemporânea de Curitiba', '15bienal.jpg', 'Vem aí: 15ª Bienal Internacional de Arte Contemporânea de Curitiba. \n\nEm breve, mais informações', 'https://www.bienaldecuritiba.com.br/', 'https://www.instagram.com/p/C2fDpGCMdhR/?hl=en', '@bienaldecuritiba', 'Curitiba, Paraná', '', '', '', '2024-01-24', '0000-00-00', 'Arte Contemporânea, Bienal, Curitiba, Paraná, Internacional', 'EV'),
(8, 'O QUE É O ART OF LOVE?', 'iArremate', 'loveart.jpg', 'O QUE É O ART OF LOVE?\n\nO Art of Love é uma das maiores exposições de arte ao ar livre do Brasil. São dezenas de esculturas de corações, pintadas por talentosos artistas e expostos em locais icônicos da cidade sede.\n\nA primeira edição na capital paulista ocorreu em 2021, onde os corações retratam histórias reais de amor e afeto vividas na pandemia.\n\nDessa vez os corações voltam à São Paulo para pulsar o amor pela própria cidade. Nesta jornada única, artistas transformam corações em obras de arte, celebrando a diversidade e a essência vibrante de São Paulo. A exposição une a paixão pela arte à missão de promover impacto social e humanitário.\n\nAo final da mostra, todas as obras serão leiloadas e o valor arrecadado destinado a ONG Gerando Falcões.\n\nParticipe do leilão que acontece no iArremate no dia 15 de outubro, às 21:30h.\n\n#artoflove #gerandofalcoes #arte #leilãobeneficente', 'https://www.iarremate.com/', 'https://www.instagram.com/p/DA_5BQLv22V/', '@iarremate.oficial', 'R. Heitor Modesto, 28 - Estação São Lourenço - MG\nCEP: 37470-000 ', 'E-mail:\nsac@iarremate.com ', 'E-mail:\nsac@iarremate.com ', 'Horário de funcionamento:\ndas 12h30 às 17h30, das 19h às 22h e plantão durante os leilões.', '0000-00-00', '2024-10-15', 'Exposição ao ar livre, Esculturas, Arte e impacto social, Leilão beneficente, ONG Gerando Falcões', 'EX'),
(9, 'Leilão de Arte', 'Errol Flynn Galeria de Arte', 'errol.jpg', 'Solicite seu catálogo digital completo por WhatsApp (31) 9.9889-5445 ou 9.9889-1515. \n\nUm conjunto espetacular de obras do artista Lorenzato pode ser apreciado na exposição até domingo, de 10 às 20 hs. As obras serão leiloadas na segunda-feira (19) e terça-feira (20), às 19:30 hs.\n\nOUTROS DESTAQUES: \n\nGuignard, Di Cavalcanti, Burle Marx, Maria Leontina, Milton Dacosta, Yara Tupynambá, Marcos Coelho Benjamim, Lucchesi, Amílcar de Castro, Poteiro,Mabe, Rubem Valentim, Teruz, Siron Franco, Lorenzato, Aldemir Martins e outros artistas brasileiros consagrados.\n\nEnviamos as obras arrematadas para qualquer local do Brasil. \n\n#leilaodearte #mercadodearte\n#coleçãodearte #artebrasileira #mercadodearte\n#pinturabrasileira #artecontemporanea #leilaodearte\n#esculturabrasileira #lorenzato', 'https://errol.com.br/', 'https://www.instagram.com/p/C-tQ_2GvK9o/?img_index=1', '@errolflynngaleria', 'Rua Curitiba\nNº 1862\nBairro Lourdes\n\nBelo Horizonte / MG\nCEP: 30.170-127', 'Telefone:\n\n(31) 3318.3830\n\nWhatsApp:  \n\n(31) 9 9889-1515\n(31) 9 9889-5445\n\ncontato@errol.com.br', '', 'SEG-SEX\n09:00 – 18:00\n\nSÁBADOS\n9:00 – 14:00', '0000-00-00', '0000-00-00', '#leilaodearte #mercadodearte\n#coleçãodearte #artebrasileira #mercadodearte\n#pinturabrasileira #artecontemporanea #leilaodearte\n#esculturabrasileira #lorenzato', 'EX'),
(10, 'Leilão da TNT Arte dia 15 de agosto às 19h.', 'TNT Arte', 'tnt.jpg', 'Leilão HOJE \n\nLote 63\nSergio Camargo \nEstudo\nEscultura de mármore\nAss. e datado 1985\nEx. coleção Layse Bittencourt\n11 x 10 x 10 cm\n\nConsiderado um dos mais originais artistas brasileiros ligados à vertente construtiva, Serfio Camargo destaca-se por explorar os limites da forma ao realizar cortes audaciosos nos materiais, em um procedimento por ele denominado “geometria empírica”.\n\nNum período em que se acredita no esgotamento da inovação e no qual se defende a superação do legado moderno, Sérgio Camargo inaugura uma trajetória em que a relação conflituosa, mas sempre atenta, com uma tradição preexistente gera uma produção inovadora e singular.\n\nLeilão da TNT Arte dia 15 de agosto às 19h. \nwww.tntarte.com.br\n\nConfira o Catálogo:  www.tntarte.com.br\n\nParticipação online e por telefone ☎️\n\n#leilaodearte #leilaodedesign #artauction #design #thaisalexandreleiloeira', 'https://www.tntarte.com.br/', 'https://www.instagram.com/p/C-rvBIaMixe/?img_index=1', '@tntarte', 'Estrada da Gávea, 899, loja 243 (Fashion Mall)\nSão Conrado, Rio de Janeiro - RJ\nCEP: 22610-001 ', '21 2495-6142\n21 99464-0374\n21 99398-0022\n21 99464-0374\n\ncontato@tntarte.com.br ', '', 'Seg\na Sábado, de 10 às 20h\nDomingo e feriados, das 14 às 20h', '0000-00-00', '0000-00-00', '#leilaodearte #leilaodedesign #artauction #design #thaisalexandreleiloeira #escultura #sergiocamargo', 'LE'),
(11, '105º Leilão da Blombô', 'Blombô', 'blombo.jpg', 'Na quarta-feira, 23 de outubro, às 20h, a Blombô realizará seu 105º Leilão de forma online através do iArremate.com. Entre os destaques desta edição, as obras de retrato e paisagem ganham especial atenção, refletindo a rica tradição da pintura de gênero na história da Arte. \n\nArtistas como Ernesto de Fiori, Samson Flexor, Edgard Maxence e José Pancetti reverberam a beleza e a complexidade desses dois gêneros, que têm sido pilares da tradição pictórica por séculos.\n\nConfira o catálogo completo no link da bio. \n\n–\n\n105º Leilão da Blombô | Arte\nPregão: 23 de outubro, às 20h\nOnline via iArremate.com', 'https://blombo.com/', 'https://www.instagram.com/p/DBWac_jCVOE/?img_index=1', '@blombo.art', 'Av. Cidade Jardim, 86 – Jd. Europa CEP: 01454-000, São Paulo - SP ', 'WhatsApp Leilões\n+55 11 94512-0354\n\nWhatsApp Marketplace\n+55 11 99695-3218\n\nE-mail\natendimento@blombo.com', '', 'Segunda à quinta-feira das 10h às 19h | Sexta-feira das 11h às 18h', '0000-00-00', '0000-00-00', '#leilaodearte\n#arteonline\n#retratos\n#paisagens\n#arteclassica\n#artemoderna\n#colecionismodearte\n#blombô', 'NV'),
(12, 'Leilão de Agosto ', 'ARTBID Leilões de Arte', 'artbid.jpg', 'Leilão de Agosto\n\nLote 59 | Georgina de Albuquerque\n\nAcesse nosso catálogo e tour virtual, link na bio.\n\n#leilaodearte\n#georginadealbuquerque', 'https://artbid.art.br', 'https://www.instagram.com/p/C-0_NLTJ_Fq/?img_index=1', '@artbid.br', 'Av. Atlântica, 4240 / 219 - Shopping Cassino Atlântico - Copacabana - Rio de Janeiro - RJ, CEP: 22070-002 ', ' (21) 97994-3333\n\ncontato@tramasgaleriadearte.com.br', 'Entrar em contato pelo WhatsApp (21) 99212-8413 ou (21) 97994-3333', 'Atendimento de 2ª a 6ª feira das 11h às 18h', '0000-00-00', '0000-00-00', '#leilaodearte\n#georginadealbuquerque\n#artebrasileira\n#colecionismodearte\n#artemoderna', 'NV'),
(13, 'Uma oficina para explorar a expressão corporal e o cinema', 'MON - Museu Oscar Niemeyer', 'monoficina.jpg', 'Uma oficina para explorar a expressão corporal e o cinema 🎥\n\nTeremos uma edição extra do Arte para Maiores deste mês! O “Laboratório Corpo e Cinema” convida a mergulhar na conexão entre a linguagem corporal e a narrativa cinematográfica por meio de jogos teatrais, performances e experimentações audiovisuais.\n\nNão é necessário conhecimento prévio em arte, inscreva-se!\n\n🗓️ 24 outubro | 14h às 17h\n\n👉 Para participar, acesse “Arte para Maiores Especial” no link da bio ou entre no site do MON e selecione a atividade em “Programação”.\n\n#MuseuOscarNiemeyer #ArteParaMaiores', 'https://www.museuoscarniemeyer.org.br/', 'https://www.instagram.com/p/DBMsM-Ni4o0/?img_index=1', '@museuoscarniemeyer', 'Rua Marechal Hermes, 999 - Centro Cívico, Curitiba, Brazil 80530-230', 'E-mail:\n\nfaleconosco@mon.org.br\n\nTelefone:\n\n+55 41 3350-4462', 'Ligue para: (41) 3350-4448.', 'Terça a domingo\ndas 10h às 18h\nacesso até as 17h30', '0000-00-00', '0000-00-00', '#MuseuOscarNiemeyer\n#ArteParaMaiores\n#LaboratorioCorpoeCinema\n#ExpressaoCorporal\n#CinemaExperimental\n#ArteParaTodos', 'MU'),
(14, '16º Salão dos Artistas sem Galeria', 'Salão dos Artistas sem Galeria', 'semgaleria.jpg', 'Só faltam duas semanas! Não deixe para o último dia, pois aqui não tem prorrogação! Estão abertas até 4/11/2024 as inscrições para a 16ª edição do Salão dos Artistas Sem Galeria (@salaodossemgaleria), idealizado e promovido pelo portal Mapa das Artes (www.mapadasartes.com.br). Poderá se inscrever qualquer artista plástico residente no país desde que brasileiro nato, naturalizado ou mesmo estrangeiro residente no Brasil com idade igual ou superior a 16 anos e que não tenha vínculo de representação com galeria paulistana. Serão selecionados 10 (dez) artistas que farão parte de mostra coletiva em São Paulo entre 18 de janeiro e 15 de março de 2025. Prêmios de R$ 1 mil, R$ 2 mil e R$ 3 mil serão distribuídos de acordo com o número de inscrições. Será concedido ainda o Prêmio Estímulo Fora do Eixo, direcionado a um artista baseado fora do eixo RJ-SP (ou seja, artistas de outro Estado da Federação ou do DF e que não figure entre os dez selecionados) no valor de R$ 1.000,00. A taxa de inscrição é de R$ 160,00. Não será aceita inscrição por e-mail, presencial ou pelos Correios, mas apenas online via Google Forms (https://forms.gle/LsSwPEPhhnwaUcZW7 ).\n\nDúvidas referentes ao Salão devem ser encaminhadas ao e-mail mapadasartes@uol.com.br até 1/11/2024. Inscrições até 4/11/2024. Leia regulamento completo na seção Salões do portal de artes mapadasartes.com.br (https://www.mapadasartes.com.br/#!/salao/1124) e no https://linktr.ee/mapadasartes.', 'https://www.mapadasartes.com.br/#!/salao/1124', 'https://www.instagram.com/p/DBbYimipjEW/', '@salaodossemgaleria', '', '(11) 3031-6007', '', 'Seg. a sex., 10h/19h; sáb., 11h/15h', '0000-00-00', '2024-11-04', '#SalãoDosArtistasSemGaleria\n#MapaDasArtes\n#ArteBrasileira\n#ArtistasIndependentes\n#InscricoesAbertas\n#ArteContemporanea', 'ED'),
(15, 'XVII Prêmio Açorianos de Artes Plásticas - Inscrições Abertas', ' Aliança Francesa de Porto Alegre', 'acorianos.jpg', 'Informamos que está aberto até o dia 19 de novembro o edital para as inscrições ao XVII Prêmio Açorianos de Artes Plásticas, referente à produção realizada de janeiro a dezembro de 2023.\n\nUma das mais tradicionais premiações do setor, o Prêmio Açorianos de Artes Plásticas tem como objetivo valorizar, homenagear e distinguir as importantes produções locais em artes visuais que se destacaram ao longo do ano de 2023. Busca também ser uma forma de registrar, mapear e fomentar as diversas manifestações e suas contribuições com processos de criação e inovação para Porto Alegre.\n\nO XVII Prêmio Açorianos de Artes Plásticas contemplará as seguintes categorias: Artista, Curadoria, Exposição, Ações de Difusão e Inovação, Publicações, Acervos, Ações de Educação, Instituição e Prêmios do Júri.\n\nPela terceira vez consecutiva, a 17ª edição do PAAP também atribuirá o Prêmio Aquisição, no valor de R$ 10.000,00 (dez mil reais), para o(a) artista contemplado(a) na categoria Artista pela trajetória nas artes. O Prêmio Aquisição contemplará a aquisição de 1 (uma) ou mais obras para o acervo artístico municipal do(a) artista selecionado(a).\n\nOs inscritos poderão receber ainda o prêmio de uma viagem (bilhetes de avião de ida e volta) para Paris, destinado a um(a) jovem curador(a), oferecido pela Aliança Francesa de Porto Alegre e uma residência artística no Ateliê de Gravura da Fundação Iberê. Além das parcerias, a Coordenação de Artes Visuais poderá disponibilizar períodos em seus espaços expositivos ou plataformas digitais para a realização de exposições para os vencedores nas categorias Artista e Curadoria.\n\nSe você produziu entre janeiro e dezembro de 2023, confira o regulamento e inscreva-se!\n\nO regulamento poderá ser obtido no site da SMCEC. As inscrições serão aceitas somente em formato digital. No ato da inscrição, os interessados deverão indicar as categorias em que pretendem concorrer, preenchendo o formulário (link na bio): https://forms.gle/t3xJ3MhivjqXeSw19\n\nPedidos de informação sobre o Regulamento poderão ser encaminhados por meio do e-mail XVIIPAAP@gmail.com.', 'https://www.afpoa.com.br/', 'https://www.instagram.com/afpoa/p/DA3hcUrvqol/?img_index=2', '@afpoa', 'Av. Cristóvão Colombo 2240, 402,\nFloresta\nCEP: 90560-001\nPorto Alegre - RS ', '(51) 3222-6070\nmarketing@afpoa.com.br - marketing/atendimento ao cliente (informações de curso)\nWhatsapp: (51) 989965594', '', 'Atendimento online e presencial:\n\nSegunda a quinta-feira das 8h30 às 18h.\nSexta-feira das 8h30min às 12h das 13h às 17h\nSábado das 8h30 às 12h', '0000-00-00', '2024-11-19', '#PremioAcorianos\n#ArtesPlasticas\n#CulturaPortoAlegre\n#InscricoesAbertas\n#ArteBrasileira\n#PremioDeArte', 'ED'),
(16, 'Residência Artística Pivô Salvador: até 1/11', 'Pivô Salvador', 'pivo.jpg', 'Em parceria com o Programa de Residências e Intercâmbios do Centro Cultural do Cariri, estão abertas, até 1º de novembro, as inscrições para a chamada pública de residência artística no Pivô Salvador, modalidade Pivô Conexão.\n\nSerão oferecidas 02 vagas para residências no CCCariri, a serem realizadas entre 10 de março e 10 de abril de 2025. A seleção é destinada exclusivamente a participantes com nascimento e residência no Estado da Bahia.\n\nPodem participar artistas e outros agentes artístico-culturais como curadores, pesquisadores, educadores, críticos, escritores, entre outros, maiores de 18 anos, com experiência e atuação em pesquisa e/ou produção artística e que tenham interesse em desenvolver um projeto de pesquisa e/ou produção.\n\n📲Arraste para o lado e confira mais informações. Convocatória completa disponível no link da bio do @pivosalvador.\n\n~ O Centro Cultural do Cariri é um equipamento da @secultceara, gerido em parceria com @institutomiranteceara.\n\nCentro Cultural do Cariri, Av. Joaquim Pinheiro Bezerra de Menezes, N 01 - Gizélia Pinheiro (Batateiras), Crato - CE.\n\n#PivôSalvador #CentroCulturaldoCariri #GovernodoCeará #InstitutoMirante #SecultCeará', 'https://pivo.org.br/noticias/chamada-aberta-do-pivo-salvador-para-residencia-artistica-em-2025/', 'https://www.instagram.com/p/DBRZs1iuxYj/?hl=en&img_index=1', '@pivosalvador', 'Pivô SP\n\nEdifício Copan, loja 54\nAvenida Ipiranga, 200\n01046-925\nSão Paulo, Brasil\n\nPivô Salvador\n\nRua Boulevard Suíço, 11A\n40301-110\nNazaré, Salvador\nBahia, Brasil', 'Pivô SP\n\n+55 (11) 3255-8703\ncontato@pivo.org.br\n\nPivô Salvador\n\n+55 (71) 4101-0540\n+55 (71) 9402-0025', '', '', '0000-00-00', '2024-11-01', '#PivôSalvador #CentroCulturaldoCariri #GovernodoCeará #InstitutoMirante #SecultCeará', 'ED'),
(17, 'Gentil Carioca - ABRE ALAS 20 -2024/2025', 'A Gentil Carioca', 'gentil.jpg', 'É com grande alegria que A Gentil Carioca anuncia a abertura do edital ABRE ALAS 20 – 2024/2025, que visa incentivar artistes promissores de diversos estados do Brasil e do exterior. O edital convida ao envio de propostas para uma exposição coletiva, a ser realizada na sede da galeria no Rio de Janeiro.\n\nAs inscrições estão abertas até o dia 10 de novembro de 2024 para artistes e/ou coletivos interessades em participar. A inscrição é gratuita e deve ser realizada exclusivamente por meio de um formulário online (localizado no documento do edital, link na bio). As propostas serão avaliadas por curadores convidades pela galeria, e selecionades serão divulgados até o dia 18 de dezembro de 2024.\n.\n.\n.\nIt is with great joy that A Gentil Carioca announces the opening of the ABRE ALAS 20 - 2024/2025 call for proposals, which aims to encourage promising artists from various states in Brazil and abroad. The open call invites proposals for a group exhibition, to be held at the gallery’s headquarters in Rio de Janeiro.\n\nApplications are open until November 10th, 2024 for artists and/or collectives interested in participating. Applications are free and must be carried out exclusively using an online form (located in the open call document, link in bio).The proposals will be evaluated by curators invited by the gallery, and the selected artists will be announced by December 18th, 2024.\n\n#agentilcarioca #abrealas20 #abrealas #editaldearte #opencall', 'https://www.agentilcarioca.com.br/', 'https://www.instagram.com/p/DA3tMwbhGk_/?hl=en', '@agentilcarioca', 'Rio de Janeiro\n\nRua Gonçalves Lédo, 11/17, sobrado | Centro\n\n20060-020 | Rio de Janeiro (RJ) | Brasil\n   \n\nSão Paulo\nTravessa Dona Paula, 108 | Higienópolis\n\n01239-050 | São Paulo (SP) | Brasil', 'Rio de Janeiro\n\nTel: +55 21 2222 1651\ncorreio@agentilcarioca.com.br\nWhatsApp  +55 21 985608524   \n\nSão Paulo\n\nTel: +55 11 3231 0054\n\nVendas \n\nvendas@a', '', 'Rio de Janeiro\n\nDe terça a sexta, das 12h às 17h\nSábado, das 12h às 16h (com agendamento prévio)\n\nSão Paulo\n\nDe terça a sexta, das 10h às 19h\nSábado, das 11h às 17h ', '0000-00-00', '2024-11-10', '#agentilcarioca #abrealas20 #abrealas #editaldearte #opencall', 'ED'),
(18, '4º Programa de Residência Artística Luis Maluf Galeria', 'Galeria Luis Maluf', 'maluf.jpg', 'Inscrições Abertas | A Luis Maluf Galeria abre inscrições para a 4ª edição do Programa de Residência Artística.\n\nCom a missão de apoiar novas gerações de artistas, o programa oferece um espaço de troca e aprendizado, promovendo o crescimento artístico e profissional.\n\nDe 08 de janeiro a 01 de março de 2025, as 12 pessoas artistas selecionadas estarão na residência, utilizando os ateliês da galeria, localizada na Barra Funda, São Paulo. Durante o programa, as pessoas participantes contarão com a orientação da curadora coordenadora Lorraine Mendes e participarão de atividades voltadas ao desenvolvimento de seus projetos. O júri será composto pela equipe da Galeria, por Maguy Etlin, colecionadora de arte, Lorraine Mendes, curadora e coordenadora do programa residência LMGA 2025 e também pelo artista visual Dalton Paula.\n\nAlém disso, entre as 12 pessoas participantes, 2 pessoas artistas serão selecionadas para uma visita ao Sertão Negro Ateliê e Escola de Artes, em período posterior ao fim da residência, em data a ser definida.\n\n-\n[Infos]\nInscrições: de 24 de setembro a 11 de novembro de 2024, até às 17h (horário de Brasília). O resultado será divulgado em 11 de dezembro de 2024.\n\nO formulário está disponível no site ou no link em nossa bio.\n\n-\n@vidamaiorqueolattes @maguy_art @sertao_negro', 'https://luismaluf.com/', 'https://www.instagram.com/p/DATvgqtJIgD/?hl=en', '@luis_maluf', 'UNIDADE JARDINS\n\nRua Peixoto Gomide, 1887\nJardins, São Paulo, SP, Brasil\n\nUNIDADE BARRA FUNDA\n\nRua Brigadeiro Galvão, 996\nBarra Funda, São Paulo, SP, Brasil', 'Telefone: +55 11 91013-2062\nE-mail: info@luismaluf.com', '', 'UNIDADE JARDINS\n\nSegunda à Sexta-feira – 10h às 19h\nSábado – 11h às 16h\n\nUNIDADE BARRA FUNDA\n\nSegunda a Sexta-feira – 10h às 19h\nSábado – 11h às 16h', '0000-00-00', '2024-11-11', '', 'ED'),
(19, 'Novo curso na área!', 'Museu do Ipiranga', 'ipiranga.jpg', 'Novo curso na área!\n\nParticipe do curso on-line \"Casas e coisas\" e descubra como os utensílios domésticos e de decoração modernos influenciaram na construção de identidades baseadas em diferenças de gênero.\n\nAs aulas vão apresentar os estudos teóricos que resultaram no desenvolvimento da curadoria da exposição de longa duração do museu, contextualizando a expografia e as narrativas contadas pelos objetos.\n\n📝Inscreva-se a partir de segunda-feira, 14/10, até o dia 1º de novembro no link da bio e garanta sua vaga!\n\n#MuseuDoIpiranga #CursosOnline #História #CulturaMaterial #CasaseCoisas\n\n#paratodosverem: texto alternativo.', 'https://museudoipiranga.org.br', 'https://www.instagram.com/p/DA_5nq9Pty1/?img_index=1', '@museudoipiranga', 'Museu do Ipiranga\nRua dos Patriotas, 100 – Ipiranga – São Paulo/SP – CEP 04207-030\n\nSede Administrativa\nRua Brigadeiro Jordão, 149 – Ipiranga – São Paulo/SP – CEP 04210-000', '(11) 2065-8000', '(11) 2065-8000', 'De terça a domingo, das 10 às 17h. Última entrada: 16h.\n\nA bilheteria abre às 9h.', '0000-00-00', '2024-11-01', '', 'MU'),
(20, 'Vem trocar ideia no ‘Diálogos em Fluxo’!', 'Museu das Favelas', 'favela.jpg', 'Nesta segunda, 28/10, das 19h às 21h, vai rolar uma roda de conversa sobre como artistas de favela estão ressignificando o cenário da arte contemporânea com suas vozes poéticas e políticas. \n\nNa mediação desse rolê, tô com a braba Emanuelle Rosa, colada com artistas de peso: Wallace Lino (@lino.wallace) , Paulo Lino (@pvlino Gael Affonso ( @gaelaffonso ) , Albarte ( @alb.arte) e Deize Tigrona (@deizetigrona) que também estão presentes na exposição, para compartilharem suas vivências nesse debate.\n\nTudo gratuito e aberto ao público, bora? ✨\n\nAnota aí:\n\n🗓️ 28/10, 19h às 21h\n📍 Museu da Maré: Av. Guilherme Maxwell, 26 - Maré, Rio de Janeiro\n\nO evento é parte da itinerância ‘Favela em Fluxo’,  que tem patrocínio do Nubank, e é uma iniciativa viabilizada por meio da Lei Rouanet, do Ministério da Cultura (@minc). \n\n#museudasfavelas #favelaemfluxo #cultura #riodejaneiro #maré #culturasp @culturasp', 'https://www.museudasfavelas.org.br/', 'https://www.instagram.com/p/DBkPcUFvHyw/?img_index=1', '@museudasfavelas', 'Largo Pátio do Colégio, 148 - Centro Histórico de São Paulo', '(11) 4240-3355. contato@museudasfavelas.org.br', '', 'Horário de funcionamento. Terça a Domingo, das 10h às 17h (com permanência até as 18h).', '0000-00-00', '0000-00-00', '', 'EV'),
(21, 'Você sabia que temos dez mostras em cartaz em nossos espaços expositivos? 👀', 'Museu Paranaense', 'paranaense.jpg', 'Confira todas as exposições e planeje sua visita! 😎\n\n▪️ Aos espíritos minerais | Anexo do museu\nIndividual de Luana Vitra acerca de qualidades espirituais e afetivas de elementos minerais.\n\n▪️ Vênus como mirada | Espaço Vitrine\nAutorretratos de Val Souza sobrepostos com imagens de mulheres negras do século XIX.\n\n▪️ Objeto Sujeito | Anexo do museu\nDoze artistas brasileiros contemporâneos em diálogo com o acervo histórico do museu.\n\n▪️ Mejtere: histórias recontadas | Anexo do museu\nNovas perspectivas sobre as coleções etnográficas do museu.\n\n▪️ Lange de Morretes: entre-paisagens | Sala Monográfica - Edifício Histórico\nConjunto de obras do artista paranaense Lange de Morretes.\n\n▪️ Ante ecos e ocos | Anexo do museu\nCultura afro-brasileira no Paraná.\n\n▪️ Nosso estado: Vento e/em Movimento | Anexo do museu\nComunidades, memórias e territórios que constituem a cultura paranaense.\n\n▪️ Ephemera/Perpétua | Andar superior Palacete São Francisco\nUm novo olhar sobre o acervo do MUPA, nos campos da antropologia, arqueologia e história.\n\n▪️ Numismática e cultura material: Coleções do Museu Paranaense | Andar térreo Palácio São Francisco\nO acervo de numismática do MUPA.\n\n▪️ Sala São Francisco | Andar térreo Palácio São Francisco\nA história do Museu Paranaense e seus departamentos.\n\nAproveite o final de semana no MUPA! 😍\n\n📍 Museu Paranaense | R. Kellers, 289 - São Francisco.\n⌚️ Terça a domingo, das 10h às 17h30.\n🎫 Entrada gratuita.\n\n#Curitiba #CulturaParaná #MUPA #Acervo #Exposição #Visite', 'https://www.museuparanaense.pr.gov.br/', 'https://www.instagram.com/p/DBezudTikd7/?img_index=1', '@museuparanaense', 'R. Kellers, 289 - São Francisco, Curitiba - PR, 80410-100', 'Telefone: +55 41 3304-3300', '', 'Terça a domingo, das 10h às 17h30.', '0000-00-00', '0000-00-00', '', 'MU'),
(22, '01 de Novembro, sexta-feira, a Galeria Refresco inaugura a exposição coletiva “Alado”', 'Galeria Refresco', 'refresco.jpg', 'No dia 01 de Novembro, sexta-feira, a Galeria Refresco inaugura a exposição coletiva “Alado”, com texto curatorial de Daniela Avellar. A mostra reúne obras de sete artistas brasileiros contemporâneos que, entre pintura e escultura, exploram relações entre temporalidades e inspiram uma ruptura com a linearidade do tempo e da história.\n\n“Um feixe de luz rasga as cortinas do presente. Alado é um ser metamórfico dotado de asas que transita entre passado, presente e futuro. Com seu gracejo, ele recolhe histórias e busca vestígios. Ele nos conta que a história do mundo nunca será mero relato, porque é capaz de construí-la e reconstruí-la através do entrelaçamento de fragmentos. A linearidade do tempo restará como uma miragem em um horizonte que aos poucos se dissolve.”\n\nArtistas participantes:\nEstevan Davi @_estevandavi\nFátima Aguiar @maedepett\nFelipe Suzuki @felipesuzuki\nGabriel Ribeiro @gbrlrbr\nGabriella Garcia @gabriellagarcia\nLucas Milano @_lucasmilano\nRenato Rios @riosrenatorios\n\nCuradoria: Refresco\nTexto: Daniela Avellar @daniela_avellar\n\nAgradecimentos: @galeriaestacao e @galerialume\n\nProjeto Expográfico: @gabigon\n\nProjeto Gráfico: @fatal_fatal_fatal @roma.romama @_avllr_ _ @sime_ak\n\nApoio: @cervejaria_ferdinander\n\nServiço:\n“Alado” - Exposição coletiva organizada pela Galeria Refresco\nRua do Rosário, n. 26 - Centro do Rio de Janeiro\nAbertura: 01 de Novembro de 18:00 às 23:00 hrs\n\n[EN]\nOn Friday, November 1st, Refresco Gallery will open the coletive exhibition “Alado,” with curatorial text by Daniela Avellar. The show brings together works by seven contemporary brazilian artists who, through painting and sculpture, explore relationships between temporalities and inspire a break from the linearity of time and history.\n\n“A beam of light cuts through the curtains of the present. Alado is a metamorphic being endowed with wings, moving between past, present, and future. With its grace, it gathers stories and seeks traces. It tells us that the history of the world will never be a mere account because it can construct and reconstruct it through the interweaving of fragments. The linearity of time will remain as a mirage on a horizon that gradually dissolves.”', 'http://refresco.art.br/', 'https://www.instagram.com/p/DBjHfxcJvza/?img_index=1', '@galeriarefresco', 'Rua do Rosário, 26 - Centro, Rio de Janeiro, Rio de Janeiro ', '', '', '', '0000-00-00', '2024-11-01', '', 'GA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `instituicoes`
--

CREATE TABLE `instituicoes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `descricao` text NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `contato` varchar(100) NOT NULL,
  `agendamento` varchar(255) DEFAULT NULL,
  `horario` varchar(255) DEFAULT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `instituicoes`
--

INSERT INTO `instituicoes` (`id`, `nome`, `categoria`, `descricao`, `endereco`, `contato`, `agendamento`, `horario`, `link`) VALUES
(1, 'MIS', 'Museus', 'teste descricao museu', 'rua do museu, n 345', 'curador', 'quintas-feiras', '10h', 'https://mis-sp.org.br/'),
(2, 'Museu do Ipiranga', 'Museus', 'novo cadastro museu', 'av independência, 541', ' ', 'aos sábados', '11h às 17h', 'https://museudoipiranga.org.br');

-- --------------------------------------------------------

--
-- Estrutura da tabela `midias`
--

CREATE TABLE `midias` (
  `id` int(11) NOT NULL,
  `imagem` varchar(200) NOT NULL,
  `descricao` varchar(600) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Email` varchar(70) NOT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `Senha` varchar(255) NOT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `DTNascimento` date DEFAULT NULL,
  `logradouro` varchar(150) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(120) DEFAULT NULL,
  `localidade` varchar(120) DEFAULT NULL,
  `uf` varchar(10) DEFAULT NULL,
  `token` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `Nome`, `Email`, `CPF`, `Senha`, `Telefone`, `DTNascimento`, `logradouro`, `complemento`, `bairro`, `localidade`, `uf`, `token`) VALUES
(1, 'Cristian', 'cristian@gmail.com', '', '$2y$10$P6ESN8GGGnsJM4a0ENVaEOmD1j7b8Fp4iT8Ar7mwYh49bFgzClBae', '', NULL, '', '', '', '', '', 'fb7d350d4365bf507dcc4e7b3fdcac3d4c29aa7a646e20b1e035158d507c9ad7'),
(2, 'Larissa', 'larissa@gmail.com', '', '$2y$10$DEHXXLP2yTiJjJAraU9Eg.eu98g9qpBdx0JNKLJdTJwXhjZN8L6xq', '', NULL, '', '', '', '', '', '1ebfb2a5f38db93c145850ef347e8fe1e15060b04289f0b3da3d4547e0dbcbc6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `filtro`
--
ALTER TABLE `filtro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homepage`
--
ALTER TABLE `homepage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instituicoes`
--
ALTER TABLE `instituicoes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `midias`
--
ALTER TABLE `midias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `filtro`
--
ALTER TABLE `filtro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homepage`
--
ALTER TABLE `homepage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `instituicoes`
--
ALTER TABLE `instituicoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `midias`
--
ALTER TABLE `midias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
