--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: hunan_town; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.town (
    gid integer,
    area numeric,
    perimeter numeric,
    cntypt_ double precision,
    cntypt_id double precision,
    name character varying(32),
    pyname character varying(50),
    class character varying(2),
    id smallint,
    pn smallint,
    adcode93 integer,
    geom public.geometry(Point,4326)
);


--
-- Data for Name: hunan_town; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.town (gid, area, perimeter, cntypt_, cntypt_id, name, pyname, class, id, pn, adcode93, geom) FROM stdin;
1347	0.000000000000000	0.000000000000000	1772	1402	澧县	Li Xian	AI	2371	1	430723	0101000020E61000008A592F8672F05B4010786000E1A33D40
1348	0.000000000000000	0.000000000000000	1773	1403	津市市	Jinshi Shi	AH	2372	1	430781	0101000020E610000055302AA913F85B40B41F2922C3A23D40
1354	0.000000000000000	0.000000000000000	1781	1409	石门县	Shimen Xian	AI	2378	1	430726	0101000020E610000059DDEA39E9D75B402C4A09C1AA963D40
1360	0.000000000000000	0.000000000000000	1790	1529	华容县	Huarong Xian	AI	2497	1	430623	0101000020E6100000B6BE4868CB235C4032923D42CD843D40
1366	0.000000000000000	0.000000000000000	1798	1641	临湘县	LinXiang Xian	AI	2607	1	430622	0101000020E6100000C269C18BBE5C5C405DDDB1D826793D40
1369	0.000000000000000	0.000000000000000	1803	1231	龙山县	Longshan Xian	AI	2204	1	433130	0101000020E6100000C7BAB88D065C5B409DF529C764753D40
1371	0.000000000000000	0.000000000000000	1805	1424	临澧县	Linli Xian	AI	2393	1	430724	0101000020E6100000A01518B2BAE95B40BFD364C6DB723D40
1374	0.000000000000000	0.000000000000000	1809	1426	慈利县	Cili Xian	AI	2395	1	430821	0101000020E61000002766BD18CAC75B4047E9D2BF246D3D40
1376	0.000000000000000	0.000000000000000	1813	1541	安乡县	Anxiang Xian	AI	2509	1	430721	0101000020E61000006D567DAEB60A5C407F87A2409F683D40
1377	0.000000000000000	0.000000000000000	1815	1331	桑植县	Sangzhi Xian	AI	2301	1	430822	0101000020E61000007FF62345648A5B4038A1100187643D40
1380	0.000000000000000	0.000000000000000	1821	1545	南县	Nan Xian	AI	2513	1	432322	0101000020E61000009CF9D51C201A5C40618E1EBFB75D3D40
1410	0.000000000000000	0.000000000000000	1869	1682	岳阳县	Yueyang Xian	AI	2647	1	430621	0101000020E61000005305A3923A475C4011FDDAFAE9233D40
1426	0.000000000000000	0.000000000000000	1900	1278	永顺县	Yongshun Xian	AI	2250	1	433127	0101000020E6100000868F882991765B4082035ABA82013D40
1437	0.000000000000000	0.000000000000000	1914	1955	汉寿县	Hanshou Xian	AI	2912	1	430722	0101000020E610000079060DFD13FE5B40118AADA069E93C40
1440	0.000000000000000	0.000000000000000	1917	1959	桃源县	Taoyuan Xian	AI	2916	1	430725	0101000020E6100000A3409FC893DE5B4096236420CFE63C40
1452	0.000000000000000	0.000000000000000	1930	2056	沅江市	Yuanjiang Shi	AH	3012	1	432302	0101000020E610000083DDB06D51185C40B471C45A7CD63C40
1455	0.000000000000000	0.000000000000000	1934	2173	汨罗市	Miluo Shi	AI	3127	1	430681	0101000020E61000005A0D897B2C455C405682C5E1CCCF3C40
1460	0.000000000000000	0.000000000000000	1942	2182	平江县	Pingjiang Xian	AI	3136	1	430626	0101000020E6100000624A24D1CB645C40F04E3E3DB6B53C40
1461	0.000000000000000	0.000000000000000	1943	1814	保靖县	Baojing Xian	AI	2775	1	433125	0101000020E61000008CF84ECC7A695B400778D2C265B53C40
1468	0.000000000000000	0.000000000000000	1952	2074	湘阴县	Xiangyin Xian	AI	3030	1	430624	0101000020E6100000BC3FDEAB56385C40693A3B191CAD3C40
1476	0.000000000000000	0.000000000000000	1963	1821	古丈县	Guzhang Xian	AI	2781	1	433126	0101000020E6100000B493C151F27C5B40172CD505BC9C3C40
1479	0.000000000000000	0.000000000000000	1967	1825	花垣县	Huayuan Xian	AI	2784	1	433124	0101000020E610000033333333335F5B4015E2917879963C40
1482	0.000000000000000	0.000000000000000	1970	2091	益阳县	Yiyang Xian	AI	3047	1	432321	0101000020E61000003D0FEECEDA175C40DA722EC555913C40
1490	0.000000000000000	0.000000000000000	1978	2099	桃江县	Taojiang Xian	AI	3054	1	432325	0101000020E61000006DFFCA4A93085C40566133C005853C40
1492	0.000000000000000	0.000000000000000	1983	1911	沅陵县	Yuanling Xian	AI	2870	1	433022	0101000020E61000008FDFDBF467995B40505260014C753C40
1504	0.000000000000000	0.000000000000000	1999	2001	安化县	Anhua Xian	AI	2958	1	432326	0101000020E6100000D656EC2FBBCD5B40A5164A26A7623C40
1507	0.000000000000000	0.000000000000000	2002	2117	望城县	Wangcheng Xian	AI	3072	1	430122	0101000020E6100000419FC893A4335C40425C397B67603C40
1517	0.000000000000000	0.000000000000000	2014	1924	泸溪县	Luxi Xian	AI	2883	1	433122	0101000020E6100000E71890BDDE895B407CEE04FBAF473C40
1521	0.000000000000000	0.000000000000000	2018	2128	宁乡县	Ningxiang Xian	AI	3083	1	430124	0101000020E6100000884677103B235C4051DA1B7C61423C40
1526	0.000000000000000	0.000000000000000	2026	2137	长沙县	Changsha Xian	AI	3091	2	430101	0101000020E6100000224F92AE993E5C40F321A81ABD323C40
1533	0.000000000000000	0.000000000000000	2033	2234	浏阳县	Liuyang Xian	AI	3188	1	430123	0101000020E6100000481B47ACC5675C40B665C0594A263C40
1545	0.000000000000000	0.000000000000000	2046	1945	辰溪县	Chenxi Xian	AI	2903	1	433023	0101000020E61000005227A089B08B5B408E90813CBB043C40
1552	0.000000000000000	0.000000000000000	2055	91	凤凰县	Fenghuang Xian	AI	1088	1	433123	0101000020E6100000632827DA55665B40B4226AA2CFF33B40
1556	0.000000000000000	0.000000000000000	2059	191	溆浦县	Xupu Xian	AI	1186	1	433024	0101000020E6100000232D95B723A65B4054C72AA567EA3B40
1558	0.000000000000000	0.000000000000000	2063	99	麻阳苗族自治县	Mayang Miaozu Zizhixian	AI	1095	1	433025	0101000020E6100000DAACFA5C6D735B40F817416326E13B40
1559	0.000000000000000	0.000000000000000	2064	392	湘潭县	Xiangtan Xian	AI	1382	2	430301	0101000020E6100000CA897615523A5C40DC48D92269DF3B40
1572	0.000000000000000	0.000000000000000	2081	297	新化县	Xinhua Xian	AI	1291	1	432524	0101000020E6100000895E46B1DCD25B4096CFF23CB8BF3B40
1574	0.000000000000000	0.000000000000000	2083	298	娄底市	Loudi Shi	AH	1292	1	432501	0101000020E6100000641EF98381FF5B40E2783E03EABD3B40
1575	0.000000000000000	0.000000000000000	2084	407	湘乡市	Xiangxiang Shi	AH	1397	1	430381	0101000020E61000003333333333215C40F9122A38BCBC3B40
1577	0.000000000000000	0.000000000000000	2087	532	株洲县	Zhuzhou Xian	AI	1521	1	430221	0101000020E610000061E0B9F770495C40F86C1D1CECB53B40
1580	0.000000000000000	0.000000000000000	2090	302	涟源市	Lianyuan Shi	AH	1296	1	432503	0101000020E6100000DE54A4C2D8EA5B40B9162D40DBB23B40
1581	0.000000000000000	0.000000000000000	2092	303	冷水江市	Lengshuijiang Shi	AH	1297	1	432502	0101000020E6100000C9B08A3732DB5B40446E861BF0B13B40
1584	0.000000000000000	0.000000000000000	2095	536	醴陵市	Liling Shi	AH	1524	1	430281	0101000020E6100000083D9B559F5F5C408EC9E2FE23AB3B40
1599	0.000000000000000	0.000000000000000	2113	442	双峰县	Shuangfeng Xian	AI	1432	1	432522	0101000020E6100000F88DAF3DB30C5C40E318C91EA1763B40
1601	0.000000000000000	0.000000000000000	2115	138	芷江侗族自治县	Zhijiang DOngzu Zizhixian	AI	1133	1	433027	0101000020E610000040F67AF7C76B5B40766F456282723B40
1609	0.000000000000000	0.000000000000000	2124	146	新晃侗族自治县	Xinhuang Dongzu Zizhixian	AI	1141	1	433026	0101000020E610000062BEBC00FB4A5B40AA285E656D5B3B40
1613	0.000000000000000	0.000000000000000	2129	241	黔阳县	Qianyang Xian	AI	1235	1	433021	0101000020E61000000D37E0F3C3885B40809F71E140543B40
1614	0.000000000000000	0.000000000000000	2130	336	新邵县	Xinshao Xian	AI	1330	1	430522	0101000020E6100000ECDD1FEF55DD5B4076887FD8D2533B40
1619	0.000000000000000	0.000000000000000	2137	487	衡山县	Hengshan Xian	AI	3064	1	430423	0101000020E6100000349D9D0C8E365C40AA6400A8E23E3B40
1620	0.000000000000000	0.000000000000000	2138	350	邵东县	Shaodong Xian	AI	1343	1	430521	0101000020E610000097CADB114EEF5B407F2F8507CD3E3B40
1632	0.000000000000000	0.000000000000000	2150	364	隆回县	Longhui Xian	AI	1356	1	430524	0101000020E6100000C1FF56B263C15B406C5D6A847E1E3B40
1634	0.000000000000000	0.000000000000000	2152	174	洪江市	Hongjiang Shi	AH	1169	1	433002	0101000020E6100000ACADD85F767F5B4011C64FE3DE1C3B40
1636	0.000000000000000	0.000000000000000	2155	487	衡东县	Hengdong Xian	AI	1476	1	430424	0101000020E610000023DBF97E6A3C5C40ED815660C8163B40
1640	0.000000000000000	0.000000000000000	2159	268	洞口县	Dongkou Xian	AI	1261	1	430525	0101000020E61000004D10751F80A45B40D7A205685B113B40
1647	0.000000000000000	0.000000000000000	2166	600	攸县	You Xian	AI	1586	1	430223	0101000020E6100000156F641EF9555C4073124A5F08013B40
1648	0.000000000000000	0.000000000000000	2167	848	邵阳县	Shaoyang Xian	AI	1822	1	430523	0101000020E6100000DBA7E33103D15B406C787AA52CFF3A40
1649	0.000000000000000	0.000000000000000	2168	953	衡阳县	Hengyang Xian	AI	1925	1	430401	0101000020E6100000A4367172BF175C401975ADBD4FF93A40
1656	0.000000000000000	0.000000000000000	2175	965	衡南县	Hengnan Xian	AI	1935	2	430401	0101000020E6100000D99942E735265C408484285FD0E63A40
1663	0.000000000000000	0.000000000000000	2183	691	会同县	Huitong Xian	AI	1674	1	433029	0101000020E6100000E4839ECDAA6D5B4000C45DBD8ADC3A40
1668	0.000000000000000	0.000000000000000	2188	1083	茶陵县	Chaling Xian	AI	2053	1	430224	0101000020E610000045F5D6C056635C40A835CD3B4ECD3A40
1671	0.000000000000000	0.000000000000000	2191	978	祁东县	Qidong Xian	AI	1948	1	430426	0101000020E61000005DE15D2EE2075C408CBAD6DEA7CA3A40
1673	0.000000000000000	0.000000000000000	2193	786	武冈县	Wugang Xian	AI	1764	1	430526	0101000020E61000002FA86F99D3A75B4010069E7B0FBB3A40
1676	0.000000000000000	0.000000000000000	2196	1092	安仁县	Anren Xian	AI	2061	1	432831	0101000020E61000009031772D21515C40F44E05DCF3B43A40
1686	0.000000000000000	0.000000000000000	2210	894	祁阳县	Qiyang Xian	AI	1867	1	432930	0101000020E61000005F29CB10C7F65B40094E7D2079973A40
1688	0.000000000000000	0.000000000000000	2213	801	绥宁县	Suining Xian	AI	1779	1	430527	0101000020E6100000359886E1238A5B40560F98874C953A40
1691	0.000000000000000	0.000000000000000	2219	720	靖州苗族侗族自治县	Jingzhou Miaozu Dongzu Zizhixian	AI	1701	1	433030	0101000020E61000008D7A8846776C5B404F58E20165933A40
1697	0.000000000000000	0.000000000000000	2227	1108	酃县	Ling Xian	AI	2077	1	430225	0101000020E61000009E5E29CB10715C4069A85148327F3A40
1702	0.000000000000000	0.000000000000000	2232	908	冷水滩市	Lengshuitan Shi	AH	1881	1	432902	0101000020E6100000E5D5390664E55B400667F0F78B713A40
1704	0.000000000000000	0.000000000000000	2234	816	新宁县	Xinning Xian	AI	1793	1	430528	0101000020E6100000B97020240BB65B401D740987DE6E3A40
1707	0.000000000000000	0.000000000000000	2238	1029	耒阳市	Leiyang Shi	AH	1999	1	430481	0101000020E6100000CE531D7233365C40FC8C0B07426A3A40
1708	0.000000000000000	0.000000000000000	2239	1031	常宁县	Changning Xian	AI	2001	1	430425	0101000020E6100000F4A62215C6185C402C11A8FE41683A40
1709	0.000000000000000	0.000000000000000	2240	916	东安县	Dong'an Xian	AI	1889	1	432922	0101000020E6100000E7E3DA5031D25B407A36AB3E57673A40
1712	0.000000000000000	0.000000000000000	2243	822	城步苗族自治县	Chengbu Miaozu Zizhixian	AI	1798	1	430529	0101000020E610000039D1AE42CA935B4030833122515C3A40
1727	0.000000000000000	0.000000000000000	2262	746	通道侗族自治县	Dongdao Tongzu Zizhixian	AI	1724	1	433031	0101000020E61000005322895E46715B401211FE45D0283A40
1730	0.000000000000000	0.000000000000000	2265	1137	永兴县	Yongxing Xian	AI	2106	1	432823	0101000020E610000025404D2D5B475C408DD2A57F49223A40
1732	0.000000000000000	0.000000000000000	2268	1140	桂东县	Guidong Xian	AI	2109	1	432829	0101000020E6100000A83AE466B87B5C403E5C72DC29153A40
1740	0.000000000000000	0.000000000000000	2277	1360	双牌县	Shuangpai Xian	AI	2325	1	432929	0101000020E61000005DA79196CAE95B405358A9A0A2F63940
1744	0.000000000000000	0.000000000000000	2281	1550	资兴市	Zixing Shi	AH	2513	1	432802	0101000020E6100000401878EE3D4E5C409087BEBB95F13940
1747	0.000000000000000	0.000000000000000	2284	1456	新田县	Xintian Xian	AI	2419	1	432928	0101000020E61000004850FC18730D5C40A54DD53DB2E93940
1757	0.000000000000000	0.000000000000000	2296	1559	郴县	Chen Xian	AI	2521	2	432801	0101000020E61000009274CDE49B415C40B9E00CFE7ECD3940
1765	0.000000000000000	0.000000000000000	2304	1472	桂阳县	Guiyang Xian	AI	2435	1	432822	0101000020E6100000DC4B1AA3752E5C40F59CF4BEF1BD3940
1776	0.000000000000000	0.000000000000000	2315	1395	宁远县	Ningyuan Xian	AI	2360	1	432924	0101000020E6100000325A475513FC5B40CE39782634993940
1777	0.000000000000000	0.000000000000000	2317	1491	嘉禾县	Jiahe Xian	AI	2454	1	432826	0101000020E6100000BED9E6C6F4165C405A2DB0C744963940
1781	0.000000000000000	0.000000000000000	2321	1580	汝城县	Rucheng Xian	AI	2542	1	432828	0101000020E6100000FA9B5088806B5C40938C9C853D8D3940
1783	0.000000000000000	0.000000000000000	2323	1400	道县	Dao Xian	AI	2365	1	432923	0101000020E610000012F758FAD0E55B402C80290307883940
1796	0.000000000000000	0.000000000000000	2338	1510	宜章县	Yizhang Xian	AI	2473	1	432824	0101000020E6100000153AAFB14B3C5C40DDB243FCC3663940
1800	0.000000000000000	0.000000000000000	2342	1511	蓝山县	Lanshan Xian	AI	2474	1	432927	0101000020E61000005EA27A6B600B5C4051A39064565F3940
1807	0.000000000000000	0.000000000000000	2349	1518	临武县	Linwu Xian	AI	2481	1	432827	0101000020E6100000833463D174225C405798BED710483940
1808	0.000000000000000	0.000000000000000	2351	1426	江永县	Jiangyong Xian	AI	2390	1	432925	0101000020E61000004FAF946588D55B40A1D79FC4E7463940
1814	0.000000000000000	0.000000000000000	2357	1431	江华瑶族自治县	Jianghua Yaozu Zizhixian	AI	2395	1	432926	0101000020E61000005322895E46E55B4097E315889E303940
\.


--
-- PostgreSQL database dump complete
--

