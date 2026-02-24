

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP SCHEMA IF EXISTS cmt_denormalized CASCADE;
CREATE SCHEMA cmt_denormalized;
SET search_path = cmt_denormalized, pg_catalog;


SET default_tablespace = '';

SET default_with_oids = false;


CREATE TABLE "Author" (
    "ID" integer NOT NULL,
    "TYPE" integer DEFAULT 0
);


CREATE TABLE "Bid" (
    "ID" integer NOT NULL,
    "adjustedBy" integer,
    "hasBid_Inv" integer
);


CREATE TABLE "Conference" (
    "ID" integer NOT NULL,
    "siteURL" integer,
    "acceptsHardcopySubmissions" integer,
    "logoURL" integer,
    date date,
    name character varying(6),
    "reviewsPerPaper" integer
);


CREATE TABLE "Document" (
    "ID" integer NOT NULL,
    "writtenBy" integer,
    "TYPE" integer DEFAULT 0,
    "comment" character varying(191)
);


CREATE TABLE "Paper" (
    "ID" integer NOT NULL,
    "paperID" integer,
    "rejectedBy" integer,
    "readByMeta-Reviewer" integer,
    "hasAuthor" integer,
    title character varying(113),
    "hasDecision" integer,
    "acceptedBy" integer,
    "TYPE" integer DEFAULT 0,
    "Reviewer" integer NOT NULL
);


CREATE TABLE "Person" (
    "ID" integer NOT NULL,
    name character varying(22),
    email character varying(41),
    "assignedByReviewer" integer,
    "TYPE" integer DEFAULT 0
);


CREATE TABLE "Preference" (
    "ID" integer NOT NULL
);


CREATE TABLE "ProgramCommittee" (
    "ID" integer NOT NULL,
    label character varying(29)
);


CREATE TABLE "ProgramCommitteeChair" (
    "ID" integer NOT NULL
);


CREATE TABLE "ProgramCommitteeMember" (
    "ID" integer NOT NULL,
    "maxPapers" integer,
    "addedBy" integer
);


CREATE TABLE "Rejection" (
    "ID" integer NOT NULL
);


CREATE TABLE "SubjectArea" (
    "ID" integer NOT NULL
);


CREATE TABLE "User" (
    "ID" integer NOT NULL,
    "acceptPaper" integer,
    "TYPE" integer DEFAULT 0
);


CREATE TABLE "assignReviewer" (
    "Administrator" integer NOT NULL,
    "Reviewer" integer NOT NULL
);


CREATE TABLE "co-writePaper" (
    "Co-author" integer NOT NULL,
    "Paper" integer NOT NULL
);


CREATE TABLE "detailsEnteredBy" (
    "Conference" integer NOT NULL,
    "Administrator" integer NOT NULL
);


CREATE TABLE "enableVirtualMeeting" (
    "Administrator" integer NOT NULL,
    "Conference" integer NOT NULL
);


CREATE TABLE "endReview" (
    "ProgramCommitteeChair" integer NOT NULL,
    "Review" integer NOT NULL
);


CREATE TABLE "enterReviewCriteria" (
    "Administrator" integer NOT NULL,
    "Conference" integer NOT NULL
);


CREATE TABLE "finalizePaperAssignment" (
    "Administrator" integer NOT NULL,
    "Conference" integer NOT NULL
);


CREATE TABLE "hardcopyMailingManifestsP" (
    "Conference" integer NOT NULL,
    "Administrator" integer NOT NULL
);


CREATE TABLE "hasConferenceMember" (
    "Conference" integer NOT NULL,
    "ConferenceMember" integer NOT NULL
);


CREATE TABLE "hasConflictOfInterest" (
    "Person" integer NOT NULL,
    "Document" integer NOT NULL
);


CREATE TABLE "hasProgramCommitteeMember" (
    "ProgramCommittee" integer NOT NULL,
    "ProgramCommitteeMember" integer NOT NULL
);


CREATE TABLE "hasSubjectArea" (
    "Paper" integer NOT NULL,
    "SubjectArea" integer NOT NULL
);


CREATE TABLE "markConflictOfInterest" (
    "ConferenceMember" integer NOT NULL,
    "Paper" integer NOT NULL
);


CREATE TABLE "paperAssignmentToolsRunBy" (
    "Conference" integer NOT NULL,
    "Administrator" integer NOT NULL
);


CREATE TABLE "reviewerBiddingStartedBy" (
    "Conference" integer NOT NULL,
    "Administrator" integer NOT NULL
);


CREATE TABLE "setMaxPapers" (
    "Administrator" integer NOT NULL,
    "ProgramCommitteeMember" integer NOT NULL
);


CREATE TABLE "submitPaper" (
    "Author" integer NOT NULL,
    "Paper" integer NOT NULL
);


COPY "Author" ("ID", "TYPE") FROM stdin;
0	0
21	0
23	0
28	0
36	0
48	0
53	0
66	0
82	0
91	0
104	0
111	0
116	0
123	0
130	0
146	0
155	0
179	0
182	0
184	0
189	0
215	0
226	0
238	0
259	0
272	0
273	0
290	0
303	0
308	0
316	0
317	0
319	0
323	0
327	0
329	0
330	0
331	0
335	0
336	0
337	0
339	0
340	0
341	0
343	0
345	0
346	0
348	0
349	0
353	0
358	0
384	0
403	0
407	0
433	0
457	0
470	0
488	0
504	0
524	0
535	0
558	0
587	0
628	0
663	0
674	0
676	0
706	0
712	0
733	0
749	0
767	0
775	0
782	0
785	0
787	0
800	0
802	0
810	0
816	0
838	0
882	0
895	0
902	0
907	0
917	0
943	0
956	0
1013	0
1015	0
1020	0
1070	0
1071	0
1114	0
1123	0
1129	0
1166	0
1198	0
1204	0
1214	0
1217	0
1228	0
1255	0
1302	0
1325	0
1332	0
1357	0
1359	0
1394	0
1397	0
1458	0
1468	0
1476	0
1496	0
1502	0
1518	0
1526	0
1542	0
1562	0
1581	0
1582	0
1583	0
1591	0
1594	0
1596	0
1624	0
1637	0
1662	0
1664	0
1678	0
1683	0
1709	0
1727	0
1730	0
1750	0
1781	0
1787	0
1790	0
1793	0
1815	0
1821	0
1839	0
1868	0
1891	0
1946	0
1980	0
2017	0
2027	0
2054	0
2056	0
2070	0
2072	0
2094	0
2125	0
2147	0
2173	0
2178	0
2189	0
2198	0
2235	0
2241	0
2315	0
2323	0
2339	0
2385	0
2426	0
2428	0
2490	0
2500	0
2528	0
2533	0
2586	0
2623	0
2624	0
2721	0
2731	0
2756	0
2783	0
2886	0
2910	0
2954	0
2973	0
13	2
19	2
30	2
35	2
38	2
46	2
47	2
51	2
54	2
64	2
67	2
71	2
83	2
86	2
93	2
99	2
107	2
112	2
118	2
126	2
129	2
131	2
135	2
139	2
143	2
144	2
147	2
154	2
161	2
174	2
176	2
180	2
195	2
196	2
197	2
199	2
201	2
209	2
213	2
217	2
227	2
228	2
257	2
270	2
275	2
279	2
288	2
291	2
301	2
305	2
352	2
357	2
359	2
372	2
382	2
385	2
396	2
401	2
405	2
412	2
432	2
443	2
445	2
458	2
459	2
460	2
466	2
497	2
516	2
520	2
544	2
549	2
551	2
560	2
561	2
566	2
567	2
572	2
581	2
592	2
605	2
606	2
615	2
620	2
622	2
623	2
627	2
629	2
641	2
644	2
661	2
673	2
686	2
691	2
693	2
701	2
710	2
713	2
720	2
721	2
725	2
734	2
735	2
738	2
747	2
753	2
755	2
756	2
766	2
770	2
777	2
794	2
801	2
808	2
809	2
819	2
821	2
822	2
828	2
833	2
836	2
843	2
844	2
856	2
858	2
859	2
877	2
884	2
887	2
896	2
911	2
915	2
921	2
923	2
927	2
928	2
935	2
936	2
941	2
961	2
964	2
971	2
972	2
983	2
992	2
998	2
1004	2
1018	2
1021	2
1050	2
1051	2
1058	2
1064	2
1069	2
1076	2
1087	2
1092	2
1098	2
1102	2
1106	2
1158	2
1179	2
1180	2
1191	2
1192	2
1193	2
1194	2
1218	2
1220	2
1225	2
1227	2
1245	2
1257	2
1260	2
1262	2
1267	2
1275	2
1276	2
1279	2
1301	2
1307	2
1310	2
1312	2
1319	2
1323	2
1329	2
1350	2
1352	2
1366	2
1369	2
1378	2
1402	2
1403	2
1436	2
1438	2
1439	2
1459	2
1462	2
1465	2
1473	2
1493	2
1495	2
1505	2
1507	2
1519	2
1522	2
1524	2
1528	2
1529	2
1541	2
1565	2
1568	2
1580	2
1590	2
1602	2
1603	2
1611	2
1615	2
1620	2
1642	2
1648	2
1677	2
1688	2
1690	2
1711	2
1720	2
1734	2
1745	2
1748	2
1758	2
1759	2
1761	2
1765	2
1775	2
1797	2
1801	2
1803	2
1807	2
1819	2
1829	2
1835	2
1843	2
1852	2
1854	2
1862	2
1869	2
1873	2
1877	2
1879	2
1882	2
1888	2
1900	2
1911	2
1914	2
1933	2
1948	2
1959	2
1971	2
1987	2
1991	2
1996	2
2003	2
2006	2
2009	2
2012	2
2016	2
2026	2
2043	2
2050	2
2064	2
2065	2
2104	2
2107	2
2119	2
2127	2
2135	2
2144	2
2152	2
2161	2
2164	2
2174	2
2181	2
2188	2
2200	2
2202	2
2212	2
2219	2
2242	2
2247	2
2256	2
2264	2
2270	2
2272	2
2286	2
2321	2
2328	2
2349	2
2350	2
2366	2
2377	2
2399	2
2416	2
2418	2
2469	2
2473	2
2476	2
2483	2
2491	2
2495	2
2504	2
2513	2
2520	2
2525	2
2531	2
2552	2
2556	2
2562	2
2566	2
2571	2
2589	2
2592	2
2595	2
2603	2
2607	2
2617	2
2619	2
2661	2
2689	2
2692	2
2699	2
2706	2
2729	2
2735	2
2737	2
2739	2
2750	2
2763	2
2782	2
2846	2
2871	2
2921	2
2927	2
2960	2
2998	2
3007	2
3012	2
3043	2
\.



COPY "Bid" ("ID", "adjustedBy", "hasBid_Inv") FROM stdin;
\.



COPY "Conference" ("ID", "siteURL", "acceptsHardcopySubmissions", "logoURL", date, name, "reviewsPerPaper") FROM stdin;
208	318	\N	\N	2014-05-05	SIGXYZ	\N
79	1062	\N	\N	2014-05-06	XSWC	\N
7	1408	\N	\N	2014-05-08	ZSWC	\N
230	2062	\N	\N	2014-05-03	YSWC	\N
254	2157	\N	\N	2015-05-09	SIGXYZ	\N
219	2798	\N	\N	2015-05-02	XSWC	\N
395	2861	\N	\N	2015-05-07	YSWC	\N
163	2887	\N	\N	2015-05-04	ZSWC	\N
\.



COPY "Document" ("ID", "writtenBy", "TYPE", "comment") FROM stdin;
1	\N	0	\N
4	\N	0	\N
8	\N	0	\N
9	\N	0	\N
12	\N	0	\N
14	\N	0	\N
15	\N	0	\N
16	\N	0	\N
24	\N	0	\N
25	\N	0	\N
33	\N	0	\N
34	\N	0	\N
40	\N	0	\N
43	\N	0	\N
49	\N	0	\N
55	\N	0	\N
56	\N	0	\N
59	\N	0	\N
60	\N	0	\N
61	\N	0	\N
62	\N	0	\N
70	\N	0	\N
72	\N	0	\N
76	\N	0	\N
77	\N	0	\N
78	\N	0	\N
80	\N	0	\N
81	\N	0	\N
89	\N	0	\N
97	\N	0	\N
100	\N	0	\N
103	\N	0	\N
105	\N	0	\N
108	\N	0	\N
114	\N	0	\N
122	\N	0	\N
124	\N	0	\N
127	\N	0	\N
133	\N	0	\N
142	\N	0	\N
150	\N	0	\N
151	\N	0	\N
160	\N	0	\N
164	\N	0	\N
165	\N	0	\N
167	\N	0	\N
170	\N	0	\N
173	\N	0	\N
175	\N	0	\N
183	\N	0	\N
185	\N	0	\N
188	\N	0	\N
190	\N	0	\N
191	\N	0	\N
194	\N	0	\N
204	\N	0	\N
207	\N	0	\N
210	\N	0	\N
211	\N	0	\N
220	\N	0	\N
221	\N	0	\N
223	\N	0	\N
229	\N	0	\N
231	\N	0	\N
232	\N	0	\N
239	\N	0	\N
240	\N	0	\N
241	\N	0	\N
242	\N	0	\N
244	\N	0	\N
247	\N	0	\N
249	\N	0	\N
250	\N	0	\N
252	\N	0	\N
256	\N	0	\N
265	\N	0	\N
266	\N	0	\N
267	\N	0	\N
268	\N	0	\N
282	\N	0	\N
284	\N	0	\N
287	\N	0	\N
298	\N	0	\N
299	\N	0	\N
302	\N	0	\N
309	\N	0	\N
310	\N	0	\N
313	\N	0	\N
350	\N	0	\N
354	\N	0	\N
360	\N	0	\N
362	\N	0	\N
368	\N	0	\N
373	\N	0	\N
374	\N	0	\N
376	\N	0	\N
378	\N	0	\N
383	\N	0	\N
392	\N	0	\N
393	\N	0	\N
394	\N	0	\N
398	\N	0	\N
399	\N	0	\N
400	\N	0	\N
404	\N	0	\N
408	\N	0	\N
411	\N	0	\N
413	\N	0	\N
414	\N	0	\N
417	\N	0	\N
418	\N	0	\N
419	\N	0	\N
420	\N	0	\N
421	\N	0	\N
422	\N	0	\N
430	\N	0	\N
437	\N	0	\N
444	\N	0	\N
446	\N	0	\N
452	\N	0	\N
455	\N	0	\N
473	\N	0	\N
474	\N	0	\N
479	\N	0	\N
480	\N	0	\N
483	\N	0	\N
485	\N	0	\N
486	\N	0	\N
487	\N	0	\N
489	\N	0	\N
490	\N	0	\N
491	\N	0	\N
492	\N	0	\N
496	\N	0	\N
499	\N	0	\N
500	\N	0	\N
502	\N	0	\N
503	\N	0	\N
505	\N	0	\N
506	\N	0	\N
507	\N	0	\N
508	\N	0	\N
509	\N	0	\N
510	\N	0	\N
512	\N	0	\N
521	\N	0	\N
526	\N	0	\N
527	\N	0	\N
530	\N	0	\N
533	\N	0	\N
536	\N	0	\N
539	\N	0	\N
542	\N	0	\N
547	\N	0	\N
556	\N	0	\N
562	\N	0	\N
568	\N	0	\N
569	\N	0	\N
570	\N	0	\N
575	\N	0	\N
578	\N	0	\N
579	\N	0	\N
582	\N	0	\N
591	\N	0	\N
594	\N	0	\N
595	\N	0	\N
598	\N	0	\N
601	\N	0	\N
602	\N	0	\N
607	\N	0	\N
608	\N	0	\N
609	\N	0	\N
611	\N	0	\N
617	\N	0	\N
618	\N	0	\N
619	\N	0	\N
624	\N	0	\N
625	\N	0	\N
635	\N	0	\N
637	\N	0	\N
639	\N	0	\N
640	\N	0	\N
646	\N	0	\N
650	\N	0	\N
651	\N	0	\N
654	\N	0	\N
655	\N	0	\N
656	\N	0	\N
659	\N	0	\N
667	\N	0	\N
669	\N	0	\N
671	\N	0	\N
678	\N	0	\N
679	\N	0	\N
684	\N	0	\N
685	\N	0	\N
696	\N	0	\N
699	\N	0	\N
700	\N	0	\N
704	\N	0	\N
705	\N	0	\N
707	\N	0	\N
708	\N	0	\N
716	\N	0	\N
717	\N	0	\N
730	\N	0	\N
736	\N	0	\N
739	\N	0	\N
740	\N	0	\N
742	\N	0	\N
745	\N	0	\N
750	\N	0	\N
751	\N	0	\N
754	\N	0	\N
760	\N	0	\N
763	\N	0	\N
764	\N	0	\N
771	\N	0	\N
772	\N	0	\N
773	\N	0	\N
774	\N	0	\N
780	\N	0	\N
781	\N	0	\N
786	\N	0	\N
788	\N	0	\N
789	\N	0	\N
790	\N	0	\N
793	\N	0	\N
795	\N	0	\N
798	\N	0	\N
803	\N	0	\N
805	\N	0	\N
806	\N	0	\N
811	\N	0	\N
815	\N	0	\N
820	\N	0	\N
824	\N	0	\N
827	\N	0	\N
834	\N	0	\N
840	\N	0	\N
847	\N	0	\N
848	\N	0	\N
849	\N	0	\N
850	\N	0	\N
851	\N	0	\N
853	\N	0	\N
854	\N	0	\N
855	\N	0	\N
860	\N	0	\N
864	\N	0	\N
867	\N	0	\N
868	\N	0	\N
870	\N	0	\N
871	\N	0	\N
878	\N	0	\N
879	\N	0	\N
888	\N	0	\N
889	\N	0	\N
901	\N	0	\N
904	\N	0	\N
905	\N	0	\N
906	\N	0	\N
913	\N	0	\N
914	\N	0	\N
922	\N	0	\N
924	\N	0	\N
925	\N	0	\N
931	\N	0	\N
933	\N	0	\N
938	\N	0	\N
939	\N	0	\N
949	\N	0	\N
952	\N	0	\N
954	\N	0	\N
960	\N	0	\N
962	\N	0	\N
965	\N	0	\N
969	\N	0	\N
973	\N	0	\N
974	\N	0	\N
978	\N	0	\N
979	\N	0	\N
982	\N	0	\N
984	\N	0	\N
985	\N	0	\N
991	\N	0	\N
994	\N	0	\N
995	\N	0	\N
996	\N	0	\N
1005	\N	0	\N
1006	\N	0	\N
1014	\N	0	\N
1017	\N	0	\N
1019	\N	0	\N
1028	\N	0	\N
1031	\N	0	\N
1033	\N	0	\N
1034	\N	0	\N
1035	\N	0	\N
1038	\N	0	\N
1042	\N	0	\N
1043	\N	0	\N
1065	\N	0	\N
1066	\N	0	\N
1081	\N	0	\N
1082	\N	0	\N
1085	\N	0	\N
1086	\N	0	\N
1090	\N	0	\N
1093	\N	0	\N
1094	\N	0	\N
1103	\N	0	\N
1104	\N	0	\N
1115	\N	0	\N
1117	\N	0	\N
1120	\N	0	\N
1121	\N	0	\N
1122	\N	0	\N
1130	\N	0	\N
1132	\N	0	\N
1134	\N	0	\N
1138	\N	0	\N
1140	\N	0	\N
1147	\N	0	\N
1148	\N	0	\N
1152	\N	0	\N
1153	\N	0	\N
1155	\N	0	\N
1162	\N	0	\N
1164	\N	0	\N
1165	\N	0	\N
1168	\N	0	\N
1169	\N	0	\N
1176	\N	0	\N
1177	\N	0	\N
1181	\N	0	\N
1182	\N	0	\N
1189	\N	0	\N
1190	\N	0	\N
1199	\N	0	\N
1200	\N	0	\N
1202	\N	0	\N
1207	\N	0	\N
1211	\N	0	\N
1216	\N	0	\N
1231	\N	0	\N
1232	\N	0	\N
1233	\N	0	\N
1238	\N	0	\N
1240	\N	0	\N
1241	\N	0	\N
1248	\N	0	\N
1251	\N	0	\N
1252	\N	0	\N
1256	\N	0	\N
1264	\N	0	\N
1265	\N	0	\N
1271	\N	0	\N
1273	\N	0	\N
1281	\N	0	\N
1288	\N	0	\N
1289	\N	0	\N
1295	\N	0	\N
1296	\N	0	\N
1297	\N	0	\N
1298	\N	0	\N
1303	\N	0	\N
1308	\N	0	\N
1311	\N	0	\N
1313	\N	0	\N
1320	\N	0	\N
1326	\N	0	\N
1331	\N	0	\N
1337	\N	0	\N
1341	\N	0	\N
1346	\N	0	\N
1353	\N	0	\N
1362	\N	0	\N
1365	\N	0	\N
1372	\N	0	\N
1383	\N	0	\N
1387	\N	0	\N
1388	\N	0	\N
1389	\N	0	\N
1392	\N	0	\N
1395	\N	0	\N
1396	\N	0	\N
1401	\N	0	\N
1407	\N	0	\N
1421	\N	0	\N
1422	\N	0	\N
1431	\N	0	\N
1434	\N	0	\N
1441	\N	0	\N
1443	\N	0	\N
1444	\N	0	\N
1450	\N	0	\N
1451	\N	0	\N
1452	\N	0	\N
1453	\N	0	\N
1455	\N	0	\N
1464	\N	0	\N
1477	\N	0	\N
1478	\N	0	\N
1479	\N	0	\N
1480	\N	0	\N
1482	\N	0	\N
1483	\N	0	\N
1486	\N	0	\N
1487	\N	0	\N
1488	\N	0	\N
1494	\N	0	\N
1498	\N	0	\N
1501	\N	0	\N
1506	\N	0	\N
1512	\N	0	\N
1515	\N	0	\N
1527	\N	0	\N
1534	\N	0	\N
1535	\N	0	\N
1536	\N	0	\N
1539	\N	0	\N
1545	\N	0	\N
1548	\N	0	\N
1566	\N	0	\N
1573	\N	0	\N
1577	\N	0	\N
1578	\N	0	\N
1587	\N	0	\N
1588	\N	0	\N
1595	\N	0	\N
1599	\N	0	\N
1600	\N	0	\N
1604	\N	0	\N
1605	\N	0	\N
1608	\N	0	\N
1612	\N	0	\N
1616	\N	0	\N
1619	\N	0	\N
1625	\N	0	\N
1630	\N	0	\N
1636	\N	0	\N
1639	\N	0	\N
1640	\N	0	\N
1643	\N	0	\N
1645	\N	0	\N
1647	\N	0	\N
1649	\N	0	\N
1651	\N	0	\N
1656	\N	0	\N
1659	\N	0	\N
1663	\N	0	\N
1668	\N	0	\N
1669	\N	0	\N
1670	\N	0	\N
1675	\N	0	\N
1680	\N	0	\N
1686	\N	0	\N
1698	\N	0	\N
1700	\N	0	\N
1706	\N	0	\N
1707	\N	0	\N
1712	\N	0	\N
1716	\N	0	\N
1722	\N	0	\N
1725	\N	0	\N
1729	\N	0	\N
1732	\N	0	\N
1733	\N	0	\N
1738	\N	0	\N
1742	\N	0	\N
1747	\N	0	\N
1752	\N	0	\N
1760	\N	0	\N
1763	\N	0	\N
1764	\N	0	\N
1770	\N	0	\N
1777	\N	0	\N
1778	\N	0	\N
1785	\N	0	\N
1788	\N	0	\N
1789	\N	0	\N
1791	\N	0	\N
1794	\N	0	\N
1795	\N	0	\N
1798	\N	0	\N
1799	\N	0	\N
1800	\N	0	\N
1804	\N	0	\N
1805	\N	0	\N
1809	\N	0	\N
1810	\N	0	\N
1811	\N	0	\N
1817	\N	0	\N
1818	\N	0	\N
1823	\N	0	\N
1827	\N	0	\N
1828	\N	0	\N
1831	\N	0	\N
1836	\N	0	\N
1842	\N	0	\N
1848	\N	0	\N
1850	\N	0	\N
1853	\N	0	\N
1859	\N	0	\N
1864	\N	0	\N
1865	\N	0	\N
1870	\N	0	\N
1871	\N	0	\N
1875	\N	0	\N
1884	\N	0	\N
1897	\N	0	\N
1907	\N	0	\N
1908	\N	0	\N
1910	\N	0	\N
1913	\N	0	\N
1916	\N	0	\N
1917	\N	0	\N
1920	\N	0	\N
1921	\N	0	\N
1922	\N	0	\N
1925	\N	0	\N
1930	\N	0	\N
1932	\N	0	\N
1934	\N	0	\N
1936	\N	0	\N
1941	\N	0	\N
1944	\N	0	\N
1954	\N	0	\N
1955	\N	0	\N
1960	\N	0	\N
1964	\N	0	\N
1969	\N	0	\N
1973	\N	0	\N
1977	\N	0	\N
1979	\N	0	\N
1981	\N	0	\N
1982	\N	0	\N
1983	\N	0	\N
1986	\N	0	\N
1988	\N	0	\N
1989	\N	0	\N
1990	\N	0	\N
1997	\N	0	\N
1998	\N	0	\N
1999	\N	0	\N
2000	\N	0	\N
2002	\N	0	\N
2007	\N	0	\N
2011	\N	0	\N
2019	\N	0	\N
2023	\N	0	\N
2034	\N	0	\N
2035	\N	0	\N
2038	\N	0	\N
2041	\N	0	\N
2044	\N	0	\N
2045	\N	0	\N
2046	\N	0	\N
2048	\N	0	\N
2049	\N	0	\N
2059	\N	0	\N
2068	\N	0	\N
2077	\N	0	\N
2080	\N	0	\N
2087	\N	0	\N
2088	\N	0	\N
2089	\N	0	\N
2090	\N	0	\N
2095	\N	0	\N
2098	\N	0	\N
2101	\N	0	\N
2102	\N	0	\N
2105	\N	0	\N
2108	\N	0	\N
2110	\N	0	\N
2112	\N	0	\N
2113	\N	0	\N
2115	\N	0	\N
2121	\N	0	\N
2122	\N	0	\N
2128	\N	0	\N
2133	\N	0	\N
2134	\N	0	\N
2139	\N	0	\N
2141	\N	0	\N
2150	\N	0	\N
2155	\N	0	\N
2169	\N	0	\N
2170	\N	0	\N
2171	\N	0	\N
2179	\N	0	\N
2183	\N	0	\N
2191	\N	0	\N
2197	\N	0	\N
2213	\N	0	\N
2215	\N	0	\N
2217	\N	0	\N
2220	\N	0	\N
2223	\N	0	\N
2231	\N	0	\N
2246	\N	0	\N
2248	\N	0	\N
2249	\N	0	\N
2252	\N	0	\N
2253	\N	0	\N
2255	\N	0	\N
2257	\N	0	\N
2260	\N	0	\N
2262	\N	0	\N
2263	\N	0	\N
2266	\N	0	\N
2269	\N	0	\N
2273	\N	0	\N
2276	\N	0	\N
2281	\N	0	\N
2285	\N	0	\N
2289	\N	0	\N
2291	\N	0	\N
2295	\N	0	\N
2298	\N	0	\N
2306	\N	0	\N
2309	\N	0	\N
2310	\N	0	\N
2313	\N	0	\N
2319	\N	0	\N
2320	\N	0	\N
2326	\N	0	\N
2327	\N	0	\N
2331	\N	0	\N
2333	\N	0	\N
2336	\N	0	\N
2338	\N	0	\N
2343	\N	0	\N
2352	\N	0	\N
2355	\N	0	\N
2356	\N	0	\N
2358	\N	0	\N
2361	\N	0	\N
2364	\N	0	\N
2369	\N	0	\N
2370	\N	0	\N
2371	\N	0	\N
2376	\N	0	\N
2380	\N	0	\N
2383	\N	0	\N
2388	\N	0	\N
2395	\N	0	\N
2402	\N	0	\N
2406	\N	0	\N
2424	\N	0	\N
2433	\N	0	\N
2434	\N	0	\N
2436	\N	0	\N
2443	\N	0	\N
2447	\N	0	\N
2451	\N	0	\N
2452	\N	0	\N
2457	\N	0	\N
2458	\N	0	\N
2460	\N	0	\N
2466	\N	0	\N
2468	\N	0	\N
2471	\N	0	\N
2474	\N	0	\N
2477	\N	0	\N
2479	\N	0	\N
2484	\N	0	\N
2486	\N	0	\N
2494	\N	0	\N
2497	\N	0	\N
2503	\N	0	\N
2508	\N	0	\N
2509	\N	0	\N
2510	\N	0	\N
2511	\N	0	\N
2512	\N	0	\N
2515	\N	0	\N
2517	\N	0	\N
2521	\N	0	\N
2527	\N	0	\N
2535	\N	0	\N
2538	\N	0	\N
2541	\N	0	\N
2544	\N	0	\N
2547	\N	0	\N
2549	\N	0	\N
2550	\N	0	\N
2554	\N	0	\N
2557	\N	0	\N
2558	\N	0	\N
2560	\N	0	\N
2567	\N	0	\N
2568	\N	0	\N
2572	\N	0	\N
2579	\N	0	\N
2583	\N	0	\N
2585	\N	0	\N
2593	\N	0	\N
2600	\N	0	\N
2618	\N	0	\N
2626	\N	0	\N
2636	\N	0	\N
2641	\N	0	\N
2644	\N	0	\N
2648	\N	0	\N
2650	\N	0	\N
2651	\N	0	\N
2654	\N	0	\N
2657	\N	0	\N
2659	\N	0	\N
2665	\N	0	\N
2670	\N	0	\N
2674	\N	0	\N
2677	\N	0	\N
2678	\N	0	\N
2682	\N	0	\N
2685	\N	0	\N
2687	\N	0	\N
2691	\N	0	\N
2697	\N	0	\N
2704	\N	0	\N
2709	\N	0	\N
2711	\N	0	\N
2714	\N	0	\N
2717	\N	0	\N
2722	\N	0	\N
2723	\N	0	\N
2726	\N	0	\N
2728	\N	0	\N
2732	\N	0	\N
2733	\N	0	\N
2738	\N	0	\N
2741	\N	0	\N
2743	\N	0	\N
2749	\N	0	\N
2754	\N	0	\N
2759	\N	0	\N
2762	\N	0	\N
2765	\N	0	\N
2769	\N	0	\N
2772	\N	0	\N
2776	\N	0	\N
2788	\N	0	\N
2799	\N	0	\N
2800	\N	0	\N
2804	\N	0	\N
2805	\N	0	\N
2806	\N	0	\N
2809	\N	0	\N
2812	\N	0	\N
2816	\N	0	\N
2817	\N	0	\N
2818	\N	0	\N
2820	\N	0	\N
2821	\N	0	\N
2823	\N	0	\N
2824	\N	0	\N
2828	\N	0	\N
2832	\N	0	\N
2834	\N	0	\N
2840	\N	0	\N
2844	\N	0	\N
2847	\N	0	\N
2850	\N	0	\N
2851	\N	0	\N
2853	\N	0	\N
2854	\N	0	\N
2855	\N	0	\N
2858	\N	0	\N
2859	\N	0	\N
2862	\N	0	\N
2867	\N	0	\N
2868	\N	0	\N
2875	\N	0	\N
2878	\N	0	\N
2880	\N	0	\N
2881	\N	0	\N
2884	\N	0	\N
2888	\N	0	\N
2889	\N	0	\N
2891	\N	0	\N
2895	\N	0	\N
2903	\N	0	\N
2909	\N	0	\N
2924	\N	0	\N
2929	\N	0	\N
2930	\N	0	\N
2931	\N	0	\N
2934	\N	0	\N
2935	\N	0	\N
2938	\N	0	\N
2940	\N	0	\N
2941	\N	0	\N
2942	\N	0	\N
2945	\N	0	\N
2946	\N	0	\N
2948	\N	0	\N
2951	\N	0	\N
2952	\N	0	\N
2961	\N	0	\N
2962	\N	0	\N
2966	\N	0	\N
2971	\N	0	\N
2974	\N	0	\N
2976	\N	0	\N
2978	\N	0	\N
2979	\N	0	\N
2981	\N	0	\N
2985	\N	0	\N
2987	\N	0	\N
2988	\N	0	\N
2990	\N	0	\N
2994	\N	0	\N
2997	\N	0	\N
3002	\N	0	\N
3004	\N	0	\N
3005	\N	0	\N
3009	\N	0	\N
3010	\N	0	\N
3013	\N	0	\N
3016	\N	0	\N
3017	\N	0	\N
3020	\N	0	\N
3024	\N	0	\N
3029	\N	0	\N
3032	\N	0	\N
3040	\N	0	\N
3042	\N	0	\N
3045	\N	0	\N
3046	\N	0	\N
3047	\N	0	\N
3048	\N	0	\N
3049	\N	0	\N
3050	\N	0	\N
3051	\N	0	\N
3052	\N	0	\N
3053	\N	0	\N
3054	\N	0	\N
3056	\N	0	\N
3057	\N	0	\N
3059	\N	0	\N
3061	\N	0	\N
3062	\N	0	\N
3065	\N	0	\N
3067	\N	0	\N
3068	\N	0	\N
3069	\N	0	\N
3072	\N	0	\N
3075	\N	0	\N
3077	\N	0	\N
3081	\N	0	\N
3	2	1	The paper "AAAA-2014" is mainly about AAAA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAA-2014 in particular
6	5	1	The paper "AAAB-2014" is mainly about AAAB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAB-2014 in particular
10	5	1	The paper "AAAC-2014" is mainly about AAAC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAC-2014 in particular
11	5	1	The paper "AAAD-2014" is mainly about AAAD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAD-2014 in particular
22	23	1	The paper "AAAE-2014" is mainly about AAAE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAE-2014 in particular
32	31	1	The paper "AAAF-2014" is mainly about AAAF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAF-2014 in particular
41	42	1	The paper "AAAG-2014" is mainly about AAAG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAG-2014 in particular
58	57	1	The paper "AAAH-2014" is mainly about AAAH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAH-2014 in particular
68	69	1	The paper "AAAI-2014" is mainly about AAAI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAI-2014 in particular
73	71	1	The paper "AAAJ-2014" is mainly about AAAJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAJ-2014 in particular
74	71	1	The paper "AAAK-2014" is mainly about AAAK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAK-2014 in particular
75	71	1	The paper "AAAL-2014" is mainly about AAAL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAL-2014 in particular
87	88	1	The paper "AAAM-2014" is mainly about AAAM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAM-2014 in particular
95	96	1	The paper "AAAN-2014" is mainly about AAAN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAN-2014 in particular
98	99	1	The paper "AAAO-2014" is mainly about AAAO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAO-2014 in particular
102	101	1	The paper "AAAP-2014" is mainly about AAAP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAP-2014 in particular
106	107	1	The paper "AAAQ-2014" is mainly about AAAQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAQ-2014 in particular
120	121	1	The paper "AAAR-2014" is mainly about AAAR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAR-2014 in particular
125	126	1	The paper "AAAS-2014" is mainly about AAAS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAS-2014 in particular
134	135	1	The paper "AAAT-2014" is mainly about AAAT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAT-2014 in particular
136	137	1	The paper "AAAU-2014" is mainly about AAAU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAU-2014 in particular
138	139	1	The paper "AAAV-2014" is mainly about AAAV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAV-2014 in particular
140	141	1	The paper "AAAW-2014" is mainly about AAAW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAW-2014 in particular
148	149	1	The paper "AAAX-2014" is mainly about AAAX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAX-2014 in particular
156	157	1	The paper "AAAY-2014" is mainly about AAAY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAY-2014 in particular
159	158	1	The paper "AAAZ-2014" is mainly about AAAZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAAZ-2014 in particular
162	161	1	The paper "AABA-2014" is mainly about AABA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABA-2014 in particular
166	161	1	The paper "AABB-2014" is mainly about AABB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABB-2014 in particular
168	169	1	The paper "AABC-2014" is mainly about AABC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABC-2014 in particular
172	171	1	The paper "AABD-2014" is mainly about AABD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABD-2014 in particular
181	182	1	The paper "AABE-2014" is mainly about AABE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABE-2014 in particular
187	186	1	The paper "AABF-2014" is mainly about AABF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABF-2014 in particular
192	193	1	The paper "AABG-2014" is mainly about AABG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABG-2014 in particular
206	205	1	The paper "AABH-2014" is mainly about AABH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABH-2014 in particular
218	217	1	The paper "AABI-2014" is mainly about AABI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABI-2014 in particular
222	217	1	The paper "AABJ-2014" is mainly about AABJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABJ-2014 in particular
233	228	1	The paper "AABK-2014" is mainly about AABK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABK-2014 in particular
234	228	1	The paper "AABL-2014" is mainly about AABL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABL-2014 in particular
235	228	1	The paper "AABM-2014" is mainly about AABM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABM-2014 in particular
236	237	1	The paper "AABN-2014" is mainly about AABN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABN-2014 in particular
243	238	1	The paper "AABO-2014" is mainly about AABO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABO-2014 in particular
246	245	1	The paper "AABP-2014" is mainly about AABP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABP-2014 in particular
251	248	1	The paper "AABQ-2014" is mainly about AABQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABQ-2014 in particular
253	248	1	The paper "AABR-2014" is mainly about AABR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABR-2014 in particular
255	248	1	The paper "AABS-2014" is mainly about AABS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABS-2014 in particular
263	262	1	The paper "AABT-2014" is mainly about AABT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABT-2014 in particular
264	262	1	The paper "AABU-2014" is mainly about AABU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABU-2014 in particular
274	275	1	The paper "AABV-2014" is mainly about AABV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABV-2014 in particular
276	277	1	The paper "AABW-2014" is mainly about AABW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABW-2014 in particular
278	279	1	The paper "AABX-2014" is mainly about AABX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABX-2014 in particular
280	281	1	The paper "AABY-2014" is mainly about AABY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABY-2014 in particular
283	197	1	The paper "AABZ-2014" is mainly about AABZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AABZ-2014 in particular
285	286	1	The paper "AACA-2014" is mainly about AACA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACA-2014 in particular
293	294	1	The paper "AACB-2014" is mainly about AACB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACB-2014 in particular
296	295	1	The paper "AACC-2014" is mainly about AACC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACC-2014 in particular
297	295	1	The paper "AACD-2014" is mainly about AACD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACD-2014 in particular
300	301	1	The paper "AACE-2014" is mainly about AACE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACE-2014 in particular
312	311	1	The paper "AACF-2014" is mainly about AACF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACF-2014 in particular
314	315	1	The paper "AACG-2014" is mainly about AACG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACG-2014 in particular
361	88	1	The paper "AACH-2014" is mainly about AACH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACH-2014 in particular
364	365	1	The paper "AACI-2014" is mainly about AACI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACI-2014 in particular
367	366	1	The paper "AACJ-2014" is mainly about AACJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACJ-2014 in particular
369	340	1	The paper "AACK-2014" is mainly about AACK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACK-2014 in particular
370	371	1	The paper "AACL-2014" is mainly about AACL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACL-2014 in particular
375	372	1	The paper "AACM-2014" is mainly about AACM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACM-2014 in particular
377	372	1	The paper "AACN-2014" is mainly about AACN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACN-2014 in particular
379	380	1	The paper "AACO-2014" is mainly about AACO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACO-2014 in particular
381	382	1	The paper "AACP-2014" is mainly about AACP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACP-2014 in particular
389	388	1	The paper "AACQ-2014" is mainly about AACQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACQ-2014 in particular
390	388	1	The paper "AACR-2014" is mainly about AACR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACR-2014 in particular
391	388	1	The paper "AACS-2014" is mainly about AACS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACS-2014 in particular
397	396	1	The paper "AACT-2014" is mainly about AACT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACT-2014 in particular
402	403	1	The paper "AACU-2014" is mainly about AACU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACU-2014 in particular
410	409	1	The paper "AACV-2014" is mainly about AACV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACV-2014 in particular
415	412	1	The paper "AACW-2014" is mainly about AACW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACW-2014 in particular
416	412	1	The paper "AACX-2014" is mainly about AACX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACX-2014 in particular
423	35	1	The paper "AACY-2014" is mainly about AACY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACY-2014 in particular
424	35	1	The paper "AACZ-2014" is mainly about AACZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AACZ-2014 in particular
425	35	1	The paper "AADA-2014" is mainly about AADA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADA-2014 in particular
426	427	1	The paper "AADB-2014" is mainly about AADB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADB-2014 in particular
428	429	1	The paper "AADC-2014" is mainly about AADC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADC-2014 in particular
436	435	1	The paper "AADD-2014" is mainly about AADD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADD-2014 in particular
438	288	1	The paper "AADE-2014" is mainly about AADE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADE-2014 in particular
439	440	1	The paper "AADF-2014" is mainly about AADF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADF-2014 in particular
441	442	1	The paper "AADG-2014" is mainly about AADG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADG-2014 in particular
447	328	1	The paper "AADH-2014" is mainly about AADH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADH-2014 in particular
453	454	1	The paper "AADI-2014" is mainly about AADI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADI-2014 in particular
461	462	1	The paper "AADJ-2014" is mainly about AADJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADJ-2014 in particular
463	464	1	The paper "AADK-2014" is mainly about AADK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADK-2014 in particular
465	466	1	The paper "AADL-2014" is mainly about AADL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADL-2014 in particular
467	468	1	The paper "AADM-2014" is mainly about AADM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADM-2014 in particular
469	470	1	The paper "AADN-2014" is mainly about AADN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADN-2014 in particular
472	471	1	The paper "AADO-2014" is mainly about AADO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADO-2014 in particular
475	476	1	The paper "AADP-2014" is mainly about AADP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADP-2014 in particular
478	477	1	The paper "AADQ-2014" is mainly about AADQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADQ-2014 in particular
481	482	1	The paper "AADR-2014" is mainly about AADR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADR-2014 in particular
484	66	1	The paper "AADS-2014" is mainly about AADS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADS-2014 in particular
493	329	1	The paper "AADT-2014" is mainly about AADT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADT-2014 in particular
494	495	1	The paper "AADU-2014" is mainly about AADU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADU-2014 in particular
498	497	1	The paper "AADV-2014" is mainly about AADV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADV-2014 in particular
501	497	1	The paper "AADW-2014" is mainly about AADW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADW-2014 in particular
511	157	1	The paper "AADX-2014" is mainly about AADX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADX-2014 in particular
513	514	1	The paper "AADY-2014" is mainly about AADY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADY-2014 in particular
515	516	1	The paper "AADZ-2014" is mainly about AADZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AADZ-2014 in particular
517	442	1	The paper "AAEA-2014" is mainly about AAEA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEA-2014 in particular
518	519	1	The paper "AAEB-2014" is mainly about AAEB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEB-2014 in particular
522	520	1	The paper "AAEC-2014" is mainly about AAEC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEC-2014 in particular
523	520	1	The paper "AAED-2014" is mainly about AAED-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAED-2014 in particular
525	524	1	The paper "AAEE-2014" is mainly about AAEE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEE-2014 in particular
528	529	1	The paper "AAEF-2014" is mainly about AAEF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEF-2014 in particular
531	177	1	The paper "AAEG-2014" is mainly about AAEG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEG-2014 in particular
532	177	1	The paper "AAEH-2014" is mainly about AAEH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEH-2014 in particular
534	177	1	The paper "AAEI-2014" is mainly about AAEI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEI-2014 in particular
538	537	1	The paper "AAEJ-2014" is mainly about AAEJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEJ-2014 in particular
540	541	1	The paper "AAEK-2014" is mainly about AAEK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEK-2014 in particular
543	544	1	The paper "AAEL-2014" is mainly about AAEL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEL-2014 in particular
546	545	1	The paper "AAEM-2014" is mainly about AAEM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEM-2014 in particular
548	279	1	The paper "AAEN-2014" is mainly about AAEN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEN-2014 in particular
553	30	1	The paper "AAEO-2014" is mainly about AAEO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEO-2014 in particular
554	555	1	The paper "AAEP-2014" is mainly about AAEP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEP-2014 in particular
563	50	1	The paper "AAEQ-2014" is mainly about AAEQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEQ-2014 in particular
564	261	1	The paper "AAER-2014" is mainly about AAER-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAER-2014 in particular
565	566	1	The paper "AAES-2014" is mainly about AAES-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAES-2014 in particular
574	387	1	The paper "AAET-2014" is mainly about AAET-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAET-2014 in particular
576	577	1	The paper "AAEU-2014" is mainly about AAEU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEU-2014 in particular
580	581	1	The paper "AAEV-2014" is mainly about AAEV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEV-2014 in particular
583	88	1	The paper "AAEW-2014" is mainly about AAEW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEW-2014 in particular
588	589	1	The paper "AAEX-2014" is mainly about AAEX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEX-2014 in particular
590	325	1	The paper "AAEY-2014" is mainly about AAEY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEY-2014 in particular
593	592	1	The paper "AAEZ-2014" is mainly about AAEZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAEZ-2014 in particular
596	597	1	The paper "AAFA-2014" is mainly about AAFA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFA-2014 in particular
599	600	1	The paper "AAFB-2014" is mainly about AAFB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFB-2014 in particular
610	99	1	The paper "AAFC-2014" is mainly about AAFC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFC-2014 in particular
612	99	1	The paper "AAFD-2014" is mainly about AAFD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFD-2014 in particular
613	143	1	The paper "AAFE-2014" is mainly about AAFE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFE-2014 in particular
614	345	1	The paper "AAFF-2014" is mainly about AAFF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFF-2014 in particular
616	615	1	The paper "AAFG-2014" is mainly about AAFG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFG-2014 in particular
631	632	1	The paper "AAFH-2014" is mainly about AAFH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFH-2014 in particular
634	633	1	The paper "AAFI-2014" is mainly about AAFI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFI-2014 in particular
636	633	1	The paper "AAFJ-2014" is mainly about AAFJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFJ-2014 in particular
638	633	1	The paper "AAFK-2014" is mainly about AAFK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFK-2014 in particular
648	647	1	The paper "AAFL-2014" is mainly about AAFL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFL-2014 in particular
649	647	1	The paper "AAFM-2014" is mainly about AAFM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFM-2014 in particular
653	652	1	The paper "AAFN-2014" is mainly about AAFN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFN-2014 in particular
657	652	1	The paper "AAFO-2014" is mainly about AAFO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFO-2014 in particular
658	652	1	The paper "AAFP-2014" is mainly about AAFP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFP-2014 in particular
665	666	1	The paper "AAFQ-2014" is mainly about AAFQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFQ-2014 in particular
668	514	1	The paper "AAFR-2014" is mainly about AAFR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFR-2014 in particular
670	514	1	The paper "AAFS-2014" is mainly about AAFS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFS-2014 in particular
677	676	1	The paper "AAFT-2014" is mainly about AAFT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFT-2014 in particular
680	681	1	The paper "AAFU-2014" is mainly about AAFU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFU-2014 in particular
683	682	1	The paper "AAFV-2014" is mainly about AAFV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFV-2014 in particular
690	691	1	The paper "AAFW-2014" is mainly about AAFW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFW-2014 in particular
692	693	1	The paper "AAFX-2014" is mainly about AAFX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFX-2014 in particular
695	694	1	The paper "AAFY-2014" is mainly about AAFY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFY-2014 in particular
698	697	1	The paper "AAFZ-2014" is mainly about AAFZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAFZ-2014 in particular
714	715	1	The paper "AAGA-2014" is mainly about AAGA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGA-2014 in particular
722	723	1	The paper "AAGB-2014" is mainly about AAGB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGB-2014 in particular
724	725	1	The paper "AAGC-2014" is mainly about AAGC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGC-2014 in particular
726	727	1	The paper "AAGD-2014" is mainly about AAGD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGD-2014 in particular
728	729	1	The paper "AAGE-2014" is mainly about AAGE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGE-2014 in particular
737	335	1	The paper "AAGF-2014" is mainly about AAGF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGF-2014 in particular
741	214	1	The paper "AAGG-2014" is mainly about AAGG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGG-2014 in particular
744	743	1	The paper "AAGH-2014" is mainly about AAGH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGH-2014 in particular
752	753	1	The paper "AAGI-2014" is mainly about AAGI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGI-2014 in particular
762	761	1	The paper "AAGJ-2014" is mainly about AAGJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGJ-2014 in particular
769	322	1	The paper "AAGK-2014" is mainly about AAGK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGK-2014 in particular
779	115	1	The paper "AAGL-2014" is mainly about AAGL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGL-2014 in particular
792	791	1	The paper "AAGM-2014" is mainly about AAGM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGM-2014 in particular
796	797	1	The paper "AAGN-2014" is mainly about AAGN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGN-2014 in particular
804	110	1	The paper "AAGO-2014" is mainly about AAGO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGO-2014 in particular
812	813	1	The paper "AAGP-2014" is mainly about AAGP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGP-2014 in particular
814	688	1	The paper "AAGQ-2014" is mainly about AAGQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGQ-2014 in particular
825	826	1	The paper "AAGR-2014" is mainly about AAGR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGR-2014 in particular
831	830	1	The paper "AAGS-2014" is mainly about AAGS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGS-2014 in particular
832	833	1	The paper "AAGT-2014" is mainly about AAGT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGT-2014 in particular
841	17	1	The paper "AAGU-2014" is mainly about AAGU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGU-2014 in particular
842	843	1	The paper "AAGV-2014" is mainly about AAGV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGV-2014 in particular
845	844	1	The paper "AAGW-2014" is mainly about AAGW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGW-2014 in particular
846	844	1	The paper "AAGX-2014" is mainly about AAGX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGX-2014 in particular
852	317	1	The paper "AAGY-2014" is mainly about AAGY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGY-2014 in particular
861	584	1	The paper "AAGZ-2014" is mainly about AAGZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAGZ-2014 in particular
862	863	1	The paper "AAHA-2014" is mainly about AAHA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHA-2014 in particular
865	866	1	The paper "AAHB-2014" is mainly about AAHB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHB-2014 in particular
869	544	1	The paper "AAHC-2014" is mainly about AAHC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHC-2014 in particular
872	544	1	The paper "AAHD-2014" is mainly about AAHD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHD-2014 in particular
885	886	1	The paper "AAHE-2014" is mainly about AAHE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHE-2014 in particular
890	891	1	The paper "AAHF-2014" is mainly about AAHF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHF-2014 in particular
892	893	1	The paper "AAHG-2014" is mainly about AAHG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHG-2014 in particular
897	898	1	The paper "AAHH-2014" is mainly about AAHH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHH-2014 in particular
899	339	1	The paper "AAHI-2014" is mainly about AAHI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHI-2014 in particular
900	176	1	The paper "AAHJ-2014" is mainly about AAHJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHJ-2014 in particular
903	902	1	The paper "AAHK-2014" is mainly about AAHK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHK-2014 in particular
912	557	1	The paper "AAHL-2014" is mainly about AAHL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHL-2014 in particular
918	919	1	The paper "AAHM-2014" is mainly about AAHM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHM-2014 in particular
930	929	1	The paper "AAHN-2014" is mainly about AAHN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHN-2014 in particular
932	584	1	The paper "AAHO-2014" is mainly about AAHO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHO-2014 in particular
945	946	1	The paper "AAHP-2014" is mainly about AAHP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHP-2014 in particular
948	947	1	The paper "AAHQ-2014" is mainly about AAHQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHQ-2014 in particular
950	951	1	The paper "AAHR-2014" is mainly about AAHR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHR-2014 in particular
953	86	1	The paper "AAHS-2014" is mainly about AAHS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHS-2014 in particular
959	958	1	The paper "AAHT-2014" is mainly about AAHT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHT-2014 in particular
966	626	1	The paper "AAHU-2014" is mainly about AAHU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHU-2014 in particular
968	967	1	The paper "AAHV-2014" is mainly about AAHV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHV-2014 in particular
970	971	1	The paper "AAHW-2014" is mainly about AAHW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHW-2014 in particular
975	972	1	The paper "AAHX-2014" is mainly about AAHX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHX-2014 in particular
976	972	1	The paper "AAHY-2014" is mainly about AAHY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHY-2014 in particular
977	972	1	The paper "AAHZ-2014" is mainly about AAHZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAHZ-2014 in particular
981	980	1	The paper "AAIA-2014" is mainly about AAIA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIA-2014 in particular
988	642	1	The paper "AAIB-2014" is mainly about AAIB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIB-2014 in particular
989	937	1	The paper "AAIC-2014" is mainly about AAIC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIC-2014 in particular
990	937	1	The paper "AAID-2014" is mainly about AAID-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAID-2014 in particular
993	992	1	The paper "AAIE-2014" is mainly about AAIE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIE-2014 in particular
997	998	1	The paper "AAIF-2014" is mainly about AAIF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIF-2014 in particular
999	1000	1	The paper "AAIG-2014" is mainly about AAIG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIG-2014 in particular
1001	777	1	The paper "AAIH-2014" is mainly about AAIH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIH-2014 in particular
1002	1003	1	The paper "AAII-2014" is mainly about AAII-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAII-2014 in particular
1007	348	1	The paper "AAIJ-2014" is mainly about AAIJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIJ-2014 in particular
1008	571	1	The paper "AAIK-2014" is mainly about AAIK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIK-2014 in particular
1010	1009	1	The paper "AAIL-2014" is mainly about AAIL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIL-2014 in particular
1012	1011	1	The paper "AAIM-2014" is mainly about AAIM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIM-2014 in particular
1016	1015	1	The paper "AAIN-2014" is mainly about AAIN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIN-2014 in particular
1023	876	1	The paper "AAIO-2014" is mainly about AAIO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIO-2014 in particular
1024	1025	1	The paper "AAIP-2014" is mainly about AAIP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIP-2014 in particular
1027	1026	1	The paper "AAIQ-2014" is mainly about AAIQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIQ-2014 in particular
1030	1029	1	The paper "AAIR-2014" is mainly about AAIR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIR-2014 in particular
1032	271	1	The paper "AAIS-2014" is mainly about AAIS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIS-2014 in particular
1036	691	1	The paper "AAIT-2014" is mainly about AAIT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIT-2014 in particular
1037	691	1	The paper "AAIU-2014" is mainly about AAIU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIU-2014 in particular
1040	1039	1	The paper "AAIV-2014" is mainly about AAIV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIV-2014 in particular
1041	1039	1	The paper "AAIW-2014" is mainly about AAIW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIW-2014 in particular
1072	1073	1	The paper "AAIX-2014" is mainly about AAIX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIX-2014 in particular
1074	464	1	The paper "AAIY-2014" is mainly about AAIY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIY-2014 in particular
1077	128	1	The paper "AAIZ-2014" is mainly about AAIZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAIZ-2014 in particular
1079	1078	1	The paper "AAJA-2014" is mainly about AAJA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJA-2014 in particular
1080	1078	1	The paper "AAJB-2014" is mainly about AAJB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJB-2014 in particular
1083	1084	1	The paper "AAJC-2014" is mainly about AAJC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJC-2014 in particular
1088	1089	1	The paper "AAJD-2014" is mainly about AAJD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJD-2014 in particular
1091	1092	1	The paper "AAJE-2014" is mainly about AAJE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJE-2014 in particular
1095	875	1	The paper "AAJF-2014" is mainly about AAJF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJF-2014 in particular
1096	875	1	The paper "AAJG-2014" is mainly about AAJG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJG-2014 in particular
1097	1098	1	The paper "AAJH-2014" is mainly about AAJH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJH-2014 in particular
1099	759	1	The paper "AAJI-2014" is mainly about AAJI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJI-2014 in particular
1100	1101	1	The paper "AAJJ-2014" is mainly about AAJJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJJ-2014 in particular
1105	1106	1	The paper "AAJK-2014" is mainly about AAJK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJK-2014 in particular
1107	320	1	The paper "AAJL-2014" is mainly about AAJL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJL-2014 in particular
1109	1108	1	The paper "AAJM-2014" is mainly about AAJM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJM-2014 in particular
1110	281	1	The paper "AAJN-2014" is mainly about AAJN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJN-2014 in particular
1111	605	1	The paper "AAJO-2014" is mainly about AAJO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJO-2014 in particular
1113	1112	1	The paper "AAJP-2014" is mainly about AAJP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJP-2014 in particular
1116	1057	1	The paper "AAJQ-2014" is mainly about AAJQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJQ-2014 in particular
1118	135	1	The paper "AAJR-2014" is mainly about AAJR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJR-2014 in particular
1119	135	1	The paper "AAJS-2014" is mainly about AAJS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJS-2014 in particular
1124	1125	1	The paper "AAJT-2014" is mainly about AAJT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJT-2014 in particular
1127	1126	1	The paper "AAJU-2014" is mainly about AAJU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJU-2014 in particular
1128	909	1	The paper "AAJV-2014" is mainly about AAJV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJV-2014 in particular
1131	1129	1	The paper "AAJW-2014" is mainly about AAJW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJW-2014 in particular
1133	324	1	The paper "AAJX-2014" is mainly about AAJX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJX-2014 in particular
1135	719	1	The paper "AAJY-2014" is mainly about AAJY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJY-2014 in particular
1137	1136	1	The paper "AAJZ-2014" is mainly about AAJZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAJZ-2014 in particular
1139	1060	1	The paper "AAKA-2014" is mainly about AAKA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKA-2014 in particular
1141	1142	1	The paper "AAKB-2014" is mainly about AAKB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKB-2014 in particular
1144	1143	1	The paper "AAKC-2014" is mainly about AAKC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKC-2014 in particular
1146	1145	1	The paper "AAKD-2014" is mainly about AAKD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKD-2014 in particular
1149	38	1	The paper "AAKE-2014" is mainly about AAKE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKE-2014 in particular
1150	38	1	The paper "AAKF-2014" is mainly about AAKF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKF-2014 in particular
1151	38	1	The paper "AAKG-2014" is mainly about AAKG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKG-2014 in particular
1154	516	1	The paper "AAKH-2014" is mainly about AAKH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKH-2014 in particular
1161	1160	1	The paper "AAKI-2014" is mainly about AAKI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKI-2014 in particular
1163	107	1	The paper "AAKJ-2014" is mainly about AAKJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKJ-2014 in particular
1167	1166	1	The paper "AAKK-2014" is mainly about AAKK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKK-2014 in particular
1170	1171	1	The paper "AAKL-2014" is mainly about AAKL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKL-2014 in particular
1172	1173	1	The paper "AAKM-2014" is mainly about AAKM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKM-2014 in particular
1175	1174	1	The paper "AAKN-2014" is mainly about AAKN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKN-2014 in particular
1178	1179	1	The paper "AAKO-2014" is mainly about AAKO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKO-2014 in particular
1183	126	1	The paper "AAKP-2014" is mainly about AAKP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKP-2014 in particular
1184	1044	1	The paper "AAKQ-2014" is mainly about AAKQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKQ-2014 in particular
1185	1186	1	The paper "AAKR-2014" is mainly about AAKR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKR-2014 in particular
1187	1188	1	The paper "AAKS-2014" is mainly about AAKS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKS-2014 in particular
1197	1196	1	The paper "AAKT-2014" is mainly about AAKT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKT-2014 in particular
1201	116	1	The paper "AAKU-2014" is mainly about AAKU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKU-2014 in particular
1205	946	1	The paper "AAKV-2014" is mainly about AAKV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKV-2014 in particular
1206	460	1	The paper "AAKW-2014" is mainly about AAKW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKW-2014 in particular
1208	1209	1	The paper "AAKX-2014" is mainly about AAKX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKX-2014 in particular
1210	45	1	The paper "AAKY-2014" is mainly about AAKY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKY-2014 in particular
1212	1213	1	The paper "AAKZ-2014" is mainly about AAKZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAKZ-2014 in particular
1215	1214	1	The paper "AALA-2014" is mainly about AALA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALA-2014 in particular
1222	1223	1	The paper "AALB-2014" is mainly about AALB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALB-2014 in particular
1224	1225	1	The paper "AALC-2014" is mainly about AALC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALC-2014 in particular
1230	1055	1	The paper "AALD-2014" is mainly about AALD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALD-2014 in particular
1234	1235	1	The paper "AALE-2014" is mainly about AALE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALE-2014 in particular
1236	199	1	The paper "AALF-2014" is mainly about AALF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALF-2014 in particular
1237	199	1	The paper "AALG-2014" is mainly about AALG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALG-2014 in particular
1239	199	1	The paper "AALH-2014" is mainly about AALH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALH-2014 in particular
1246	1245	1	The paper "AALI-2014" is mainly about AALI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALI-2014 in particular
1247	1245	1	The paper "AALJ-2014" is mainly about AALJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALJ-2014 in particular
1250	1249	1	The paper "AALK-2014" is mainly about AALK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALK-2014 in particular
1259	1260	1	The paper "AALL-2014" is mainly about AALL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALL-2014 in particular
1261	1262	1	The paper "AALM-2014" is mainly about AALM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALM-2014 in particular
1263	719	1	The paper "AALN-2014" is mainly about AALN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALN-2014 in particular
1270	1269	1	The paper "AALO-2014" is mainly about AALO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALO-2014 in particular
1272	1219	1	The paper "AALP-2014" is mainly about AALP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALP-2014 in particular
1278	1279	1	The paper "AALQ-2014" is mainly about AALQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALQ-2014 in particular
1283	1282	1	The paper "AALR-2014" is mainly about AALR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALR-2014 in particular
1284	1282	1	The paper "AALS-2014" is mainly about AALS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALS-2014 in particular
1285	482	1	The paper "AALT-2014" is mainly about AALT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALT-2014 in particular
1286	1287	1	The paper "AALU-2014" is mainly about AALU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALU-2014 in particular
1291	279	1	The paper "AALV-2014" is mainly about AALV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALV-2014 in particular
1292	1061	1	The paper "AALW-2014" is mainly about AALW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALW-2014 in particular
1294	1293	1	The paper "AALX-2014" is mainly about AALX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALX-2014 in particular
1309	1310	1	The paper "AALY-2014" is mainly about AALY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALY-2014 in particular
1316	1317	1	The paper "AALZ-2014" is mainly about AALZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AALZ-2014 in particular
1318	1319	1	The paper "AAMA-2014" is mainly about AAMA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMA-2014 in particular
1327	927	1	The paper "AAMB-2014" is mainly about AAMB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMB-2014 in particular
1328	1329	1	The paper "AAMC-2014" is mainly about AAMC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMC-2014 in particular
1330	64	1	The paper "AAMD-2014" is mainly about AAMD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMD-2014 in particular
1336	1335	1	The paper "AAME-2014" is mainly about AAME-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAME-2014 in particular
1338	1192	1	The paper "AAMF-2014" is mainly about AAMF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMF-2014 in particular
1340	1339	1	The paper "AAMG-2014" is mainly about AAMG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMG-2014 in particular
1342	371	1	The paper "AAMH-2014" is mainly about AAMH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMH-2014 in particular
1345	1257	1	The paper "AAMI-2014" is mainly about AAMI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMI-2014 in particular
1347	1348	1	The paper "AAMJ-2014" is mainly about AAMJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMJ-2014 in particular
1354	1355	1	The paper "AAMK-2014" is mainly about AAMK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMK-2014 in particular
1361	1360	1	The paper "AAML-2014" is mainly about AAML-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAML-2014 in particular
1363	1364	1	The paper "AAMM-2014" is mainly about AAMM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMM-2014 in particular
1373	1071	1	The paper "AAMN-2014" is mainly about AAMN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMN-2014 in particular
1374	1321	1	The paper "AAMO-2014" is mainly about AAMO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMO-2014 in particular
1375	1376	1	The paper "AAMP-2014" is mainly about AAMP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMP-2014 in particular
1379	1380	1	The paper "AAMQ-2014" is mainly about AAMQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMQ-2014 in particular
1381	1382	1	The paper "AAMR-2014" is mainly about AAMR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMR-2014 in particular
1384	143	1	The paper "AAMS-2014" is mainly about AAMS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMS-2014 in particular
1385	139	1	The paper "AAMT-2014" is mainly about AAMT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMT-2014 in particular
1386	139	1	The paper "AAMU-2014" is mainly about AAMU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMU-2014 in particular
1391	1390	1	The paper "AAMV-2014" is mainly about AAMV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMV-2014 in particular
1400	946	1	The paper "AAMW-2014" is mainly about AAMW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMW-2014 in particular
1406	1405	1	The paper "AAMX-2014" is mainly about AAMX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMX-2014 in particular
1423	597	1	The paper "AAMY-2014" is mainly about AAMY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMY-2014 in particular
1424	1425	1	The paper "AAMZ-2014" is mainly about AAMZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAMZ-2014 in particular
1428	1429	1	The paper "AANA-2014" is mainly about AANA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANA-2014 in particular
1430	876	1	The paper "AANB-2014" is mainly about AANB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANB-2014 in particular
1432	876	1	The paper "AANC-2014" is mainly about AANC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANC-2014 in particular
1433	464	1	The paper "AAND-2014" is mainly about AAND-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAND-2014 in particular
1440	96	1	The paper "AANE-2014" is mainly about AANE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANE-2014 in particular
1442	338	1	The paper "AANF-2014" is mainly about AANF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANF-2014 in particular
1445	1446	1	The paper "AANG-2014" is mainly about AANG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANG-2014 in particular
1447	462	1	The paper "AANH-2014" is mainly about AANH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANH-2014 in particular
1449	1448	1	The paper "AANI-2014" is mainly about AANI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANI-2014 in particular
1454	319	1	The paper "AANJ-2014" is mainly about AANJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANJ-2014 in particular
1456	1418	1	The paper "AANK-2014" is mainly about AANK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANK-2014 in particular
1460	908	1	The paper "AANL-2014" is mainly about AANL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANL-2014 in particular
1461	1462	1	The paper "AANM-2014" is mainly about AANM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANM-2014 in particular
1463	817	1	The paper "AANN-2014" is mainly about AANN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANN-2014 in particular
1470	27	1	The paper "AANO-2014" is mainly about AANO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANO-2014 in particular
1471	1472	1	The paper "AANP-2014" is mainly about AANP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANP-2014 in particular
1481	1476	1	The paper "AANQ-2014" is mainly about AANQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANQ-2014 in particular
1484	1485	1	The paper "AANR-2014" is mainly about AANR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANR-2014 in particular
1489	1242	1	The paper "AANS-2014" is mainly about AANS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANS-2014 in particular
1490	1242	1	The paper "AANT-2014" is mainly about AANT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANT-2014 in particular
1491	1242	1	The paper "AANU-2014" is mainly about AANU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANU-2014 in particular
1500	1073	1	The paper "AANV-2014" is mainly about AANV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANV-2014 in particular
1508	1507	1	The paper "AANW-2014" is mainly about AANW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANW-2014 in particular
1509	1507	1	The paper "AANX-2014" is mainly about AANX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANX-2014 in particular
1510	1507	1	The paper "AANY-2014" is mainly about AANY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANY-2014 in particular
1511	458	1	The paper "AANZ-2014" is mainly about AANZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AANZ-2014 in particular
1513	458	1	The paper "AAOA-2014" is mainly about AAOA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOA-2014 in particular
1514	458	1	The paper "AAOB-2014" is mainly about AAOB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOB-2014 in particular
1521	1520	1	The paper "AAOC-2014" is mainly about AAOC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOC-2014 in particular
1523	817	1	The paper "AAOD-2014" is mainly about AAOD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOD-2014 in particular
1525	1056	1	The paper "AAOE-2014" is mainly about AAOE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOE-2014 in particular
1532	1413	1	The paper "AAOF-2014" is mainly about AAOF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOF-2014 in particular
1533	1046	1	The paper "AAOG-2014" is mainly about AAOG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOG-2014 in particular
1537	1046	1	The paper "AAOH-2014" is mainly about AAOH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOH-2014 in particular
1538	1046	1	The paper "AAOI-2014" is mainly about AAOI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOI-2014 in particular
1544	1543	1	The paper "AAOJ-2014" is mainly about AAOJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOJ-2014 in particular
1546	1056	1	The paper "AAOK-2014" is mainly about AAOK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOK-2014 in particular
1547	1056	1	The paper "AAOL-2014" is mainly about AAOL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOL-2014 in particular
1549	1550	1	The paper "AAOM-2014" is mainly about AAOM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOM-2014 in particular
1551	316	1	The paper "AAON-2014" is mainly about AAON-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAON-2014 in particular
1552	1553	1	The paper "AAOO-2014" is mainly about AAOO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOO-2014 in particular
1555	1106	1	The paper "AAOP-2014" is mainly about AAOP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOP-2014 in particular
1556	1557	1	The paper "AAOQ-2014" is mainly about AAOQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOQ-2014 in particular
1558	944	1	The paper "AAOR-2014" is mainly about AAOR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOR-2014 in particular
1559	688	1	The paper "AAOS-2014" is mainly about AAOS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOS-2014 in particular
1560	180	1	The paper "AAOT-2014" is mainly about AAOT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOT-2014 in particular
1564	597	1	The paper "AAOU-2014" is mainly about AAOU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOU-2014 in particular
1569	1570	1	The paper "AAOV-2014" is mainly about AAOV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOV-2014 in particular
1571	304	1	The paper "AAOW-2014" is mainly about AAOW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOW-2014 in particular
1572	304	1	The paper "AAOX-2014" is mainly about AAOX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOX-2014 in particular
1574	1315	1	The paper "AAOY-2014" is mainly about AAOY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOY-2014 in particular
1575	1315	1	The paper "AAOZ-2014" is mainly about AAOZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAOZ-2014 in particular
1576	1568	1	The paper "AAPA-2014" is mainly about AAPA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPA-2014 in particular
1584	881	1	The paper "AAPB-2014" is mainly about AAPB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPB-2014 in particular
1585	1304	1	The paper "AAPC-2014" is mainly about AAPC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPC-2014 in particular
1586	153	1	The paper "AAPD-2014" is mainly about AAPD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPD-2014 in particular
1592	1593	1	The paper "AAPE-2014" is mainly about AAPE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPE-2014 in particular
1597	784	1	The paper "AAPF-2014" is mainly about AAPF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPF-2014 in particular
1598	1226	1	The paper "AAPG-2014" is mainly about AAPG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPG-2014 in particular
1601	1602	1	The paper "AAPH-2014" is mainly about AAPH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPH-2014 in particular
1606	1059	1	The paper "AAPI-2014" is mainly about AAPI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPI-2014 in particular
1607	725	1	The paper "AAPJ-2014" is mainly about AAPJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPJ-2014 in particular
1609	971	1	The paper "AAPK-2014" is mainly about AAPK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPK-2014 in particular
1610	725	1	The paper "AAPL-2014" is mainly about AAPL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPL-2014 in particular
1613	710	1	The paper "AAPM-2014" is mainly about AAPM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPM-2014 in particular
1614	1156	1	The paper "AAPN-2014" is mainly about AAPN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPN-2014 in particular
1617	1618	1	The paper "AAPO-2014" is mainly about AAPO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPO-2014 in particular
1621	1620	1	The paper "AAPP-2014" is mainly about AAPP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPP-2014 in particular
1622	1620	1	The paper "AAPQ-2014" is mainly about AAPQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPQ-2014 in particular
1623	1620	1	The paper "AAPR-2014" is mainly about AAPR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPR-2014 in particular
1626	753	1	The paper "AAPS-2014" is mainly about AAPS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPS-2014 in particular
1627	1047	1	The paper "AAPT-2014" is mainly about AAPT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPT-2014 in particular
1628	1629	1	The paper "AAPU-2014" is mainly about AAPU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPU-2014 in particular
1631	1632	1	The paper "AAPV-2014" is mainly about AAPV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPV-2014 in particular
1633	1351	1	The paper "AAPW-2014" is mainly about AAPW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPW-2014 in particular
1635	1634	1	The paper "AAPX-2014" is mainly about AAPX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPX-2014 in particular
1638	64	1	The paper "AAPY-2014" is mainly about AAPY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPY-2014 in particular
1641	119	1	The paper "AAPZ-2014" is mainly about AAPZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAPZ-2014 in particular
1644	757	1	The paper "AAQA-2014" is mainly about AAQA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQA-2014 in particular
1646	1226	1	The paper "AAQB-2014" is mainly about AAQB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQB-2014 in particular
1650	1000	1	The paper "AAQC-2014" is mainly about AAQC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQC-2014 in particular
1653	693	1	The paper "AAQD-2014" is mainly about AAQD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQD-2014 in particular
1654	200	1	The paper "AAQE-2014" is mainly about AAQE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQE-2014 in particular
1655	1583	1	The paper "AAQF-2014" is mainly about AAQF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQF-2014 in particular
1657	1658	1	The paper "AAQG-2014" is mainly about AAQG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQG-2014 in particular
1660	839	1	The paper "AAQH-2014" is mainly about AAQH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQH-2014 in particular
1661	843	1	The paper "AAQI-2014" is mainly about AAQI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQI-2014 in particular
1667	729	1	The paper "AAQJ-2014" is mainly about AAQJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQJ-2014 in particular
1671	710	1	The paper "AAQK-2014" is mainly about AAQK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQK-2014 in particular
1673	1672	1	The paper "AAQL-2014" is mainly about AAQL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQL-2014 in particular
1674	1672	1	The paper "AAQM-2014" is mainly about AAQM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQM-2014 in particular
1679	1419	1	The paper "AAQN-2014" is mainly about AAQN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQN-2014 in particular
1682	1681	1	The paper "AAQO-2014" is mainly about AAQO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQO-2014 in particular
1685	759	1	The paper "AAQP-2014" is mainly about AAQP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQP-2014 in particular
1689	1690	1	The paper "AAQQ-2014" is mainly about AAQQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQQ-2014 in particular
1691	921	1	The paper "AAQR-2014" is mainly about AAQR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQR-2014 in particular
1692	82	1	The paper "AAQS-2014" is mainly about AAQS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQS-2014 in particular
1693	1244	1	The paper "AAQT-2014" is mainly about AAQT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQT-2014 in particular
1695	1696	1	The paper "AAQU-2014" is mainly about AAQU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQU-2014 in particular
1697	1473	1	The paper "AAQV-2014" is mainly about AAQV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQV-2014 in particular
1699	137	1	The paper "AAQW-2014" is mainly about AAQW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQW-2014 in particular
1701	176	1	The paper "AAQX-2014" is mainly about AAQX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQX-2014 in particular
1703	1702	1	The paper "AAQY-2014" is mainly about AAQY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQY-2014 in particular
1704	1705	1	The paper "AAQZ-2014" is mainly about AAQZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAQZ-2014 in particular
1710	1711	1	The paper "AARA-2014" is mainly about AARA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARA-2014 in particular
1714	63	1	The paper "AARB-2014" is mainly about AARB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARB-2014 in particular
1715	63	1	The paper "AARC-2014" is mainly about AARC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARC-2014 in particular
1717	1209	1	The paper "AARD-2014" is mainly about AARD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARD-2014 in particular
1721	39	1	The paper "AARE-2014" is mainly about AARE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARE-2014 in particular
1723	1420	1	The paper "AARF-2014" is mainly about AARF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARF-2014 in particular
1724	645	1	The paper "AARG-2014" is mainly about AARG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARG-2014 in particular
1731	1730	1	The paper "AARH-2014" is mainly about AARH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARH-2014 in particular
1736	1737	1	The paper "AARI-2014" is mainly about AARI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARI-2014 in particular
1740	1739	1	The paper "AARJ-2014" is mainly about AARJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARJ-2014 in particular
1743	1744	1	The paper "AARK-2014" is mainly about AARK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARK-2014 in particular
1754	1753	1	The paper "AARL-2014" is mainly about AARL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARL-2014 in particular
1755	1753	1	The paper "AARM-2014" is mainly about AARM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARM-2014 in particular
1756	808	1	The paper "AARN-2014" is mainly about AARN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARN-2014 in particular
1771	1658	1	The paper "AARO-2014" is mainly about AARO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARO-2014 in particular
1772	1773	1	The paper "AARP-2014" is mainly about AARP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARP-2014 in particular
1776	731	1	The paper "AARQ-2014" is mainly about AARQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARQ-2014 in particular
1779	1025	1	The paper "AARR-2014" is mainly about AARR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARR-2014 in particular
1780	1781	1	The paper "AARS-2014" is mainly about AARS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARS-2014 in particular
1782	1220	1	The paper "AART-2014" is mainly about AART-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AART-2014 in particular
1783	1370	1	The paper "AARU-2014" is mainly about AARU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARU-2014 in particular
1784	645	1	The paper "AARV-2014" is mainly about AARV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARV-2014 in particular
1792	289	1	The paper "AARW-2014" is mainly about AARW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARW-2014 in particular
1808	835	1	The paper "AARX-2014" is mainly about AARX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARX-2014 in particular
1814	1813	1	The paper "AARY-2014" is mainly about AARY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARY-2014 in particular
1822	1101	1	The paper "AARZ-2014" is mainly about AARZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AARZ-2014 in particular
1824	552	1	The paper "AASA-2014" is mainly about AASA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASA-2014 in particular
1825	674	1	The paper "AASB-2014" is mainly about AASB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASB-2014 in particular
1826	286	1	The paper "AASC-2014" is mainly about AASC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASC-2014 in particular
1833	1414	1	The paper "AASD-2014" is mainly about AASD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASD-2014 in particular
1834	809	1	The paper "AASE-2014" is mainly about AASE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASE-2014 in particular
1838	1839	1	The paper "AASF-2014" is mainly about AASF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASF-2014 in particular
1840	176	1	The paper "AASG-2014" is mainly about AASG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASG-2014 in particular
1845	1350	1	The paper "AASH-2014" is mainly about AASH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASH-2014 in particular
1846	660	1	The paper "AASI-2014" is mainly about AASI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASI-2014 in particular
1847	1356	1	The paper "AASJ-2014" is mainly about AASJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASJ-2014 in particular
1849	1356	1	The paper "AASK-2014" is mainly about AASK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASK-2014 in particular
1851	702	1	The paper "AASL-2014" is mainly about AASL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASL-2014 in particular
1857	1709	1	The paper "AASM-2014" is mainly about AASM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASM-2014 in particular
1858	516	1	The paper "AASN-2014" is mainly about AASN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASN-2014 in particular
1860	581	1	The paper "AASO-2014" is mainly about AASO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASO-2014 in particular
1861	1191	1	The paper "AASP-2014" is mainly about AASP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASP-2014 in particular
1863	1862	1	The paper "AASQ-2014" is mainly about AASQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASQ-2014 in particular
1874	664	1	The paper "AASR-2014" is mainly about AASR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASR-2014 in particular
1880	1568	1	The paper "AASS-2014" is mainly about AASS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASS-2014 in particular
1883	874	1	The paper "AAST-2014" is mainly about AAST-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAST-2014 in particular
1885	1225	1	The paper "AASU-2014" is mainly about AASU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASU-2014 in particular
1886	90	1	The paper "AASV-2014" is mainly about AASV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASV-2014 in particular
1889	1319	1	The paper "AASW-2014" is mainly about AASW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASW-2014 in particular
1890	1891	1	The paper "AASX-2014" is mainly about AASX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASX-2014 in particular
1892	27	1	The paper "AASY-2014" is mainly about AASY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASY-2014 in particular
1893	998	1	The paper "AASZ-2014" is mainly about AASZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AASZ-2014 in particular
1894	1266	1	The paper "AATA-2014" is mainly about AATA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATA-2014 in particular
1896	1895	1	The paper "AATB-2014" is mainly about AATB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATB-2014 in particular
1899	1260	1	The paper "AATC-2014" is mainly about AATC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATC-2014 in particular
1901	1902	1	The paper "AATD-2014" is mainly about AATD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATD-2014 in particular
1903	1904	1	The paper "AATE-2014" is mainly about AATE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATE-2014 in particular
1906	1905	1	The paper "AATF-2014" is mainly about AATF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATF-2014 in particular
1912	1768	1	The paper "AATG-2014" is mainly about AATG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATG-2014 in particular
1915	1397	1	The paper "AATH-2014" is mainly about AATH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATH-2014 in particular
1919	1918	1	The paper "AATI-2014" is mainly about AATI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATI-2014 in particular
1923	1003	1	The paper "AATJ-2014" is mainly about AATJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATJ-2014 in particular
1924	321	1	The paper "AATK-2014" is mainly about AATK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATK-2014 in particular
1926	64	1	The paper "AATL-2014" is mainly about AATL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATL-2014 in particular
1927	1928	1	The paper "AATM-2014" is mainly about AATM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATM-2014 in particular
1929	1191	1	The paper "AATN-2014" is mainly about AATN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATN-2014 in particular
1931	1191	1	The paper "AATO-2014" is mainly about AATO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATO-2014 in particular
1935	1775	1	The paper "AATP-2014" is mainly about AATP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATP-2014 in particular
1937	1775	1	The paper "AATQ-2014" is mainly about AATQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATQ-2014 in particular
1938	1939	1	The paper "AATR-2014" is mainly about AATR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATR-2014 in particular
1940	1412	1	The paper "AATS-2014" is mainly about AATS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATS-2014 in particular
1942	144	1	The paper "AATT-2014" is mainly about AATT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATT-2014 in particular
1943	144	1	The paper "AATU-2014" is mainly about AATU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATU-2014 in particular
1945	1696	1	The paper "AATV-2014" is mainly about AATV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATV-2014 in particular
1947	1092	1	The paper "AATW-2014" is mainly about AATW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATW-2014 in particular
1949	1334	1	The paper "AATX-2014" is mainly about AATX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATX-2014 in particular
1950	986	1	The paper "AATY-2014" is mainly about AATY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATY-2014 in particular
1951	1952	1	The paper "AATZ-2014" is mainly about AATZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AATZ-2014 in particular
1953	810	1	The paper "AAUA-2014" is mainly about AAUA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUA-2014 in particular
1956	675	1	The paper "AAUB-2014" is mainly about AAUB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUB-2014 in particular
1957	746	1	The paper "AAUC-2014" is mainly about AAUC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUC-2014 in particular
1958	260	1	The paper "AAUD-2014" is mainly about AAUD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUD-2014 in particular
1961	782	1	The paper "AAUE-2014" is mainly about AAUE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUE-2014 in particular
1962	129	1	The paper "AAUF-2014" is mainly about AAUF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUF-2014 in particular
1963	129	1	The paper "AAUG-2014" is mainly about AAUG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUG-2014 in particular
1966	1965	1	The paper "AAUH-2014" is mainly about AAUH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUH-2014 in particular
1970	306	1	The paper "AAUI-2014" is mainly about AAUI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUI-2014 in particular
1974	434	1	The paper "AAUJ-2014" is mainly about AAUJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUJ-2014 in particular
1975	434	1	The paper "AAUK-2014" is mainly about AAUK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUK-2014 in particular
1976	434	1	The paper "AAUL-2014" is mainly about AAUL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUL-2014 in particular
1985	828	1	The paper "AAUM-2014" is mainly about AAUM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUM-2014 in particular
1994	449	1	The paper "AAUN-2014" is mainly about AAUN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUN-2014 in particular
2001	27	1	The paper "AAUO-2014" is mainly about AAUO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUO-2014 in particular
2013	349	1	The paper "AAUP-2014" is mainly about AAUP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUP-2014 in particular
2014	92	1	The paper "AAUQ-2014" is mainly about AAUQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUQ-2014 in particular
2018	1767	1	The paper "AAUR-2014" is mainly about AAUR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUR-2014 in particular
2021	957	1	The paper "AAUS-2014" is mainly about AAUS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUS-2014 in particular
2022	1329	1	The paper "AAUT-2014" is mainly about AAUT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUT-2014 in particular
2029	1159	1	The paper "AAUU-2014" is mainly about AAUU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUU-2014 in particular
2030	1159	1	The paper "AAUV-2014" is mainly about AAUV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUV-2014 in particular
2031	1159	1	The paper "AAUW-2014" is mainly about AAUW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUW-2014 in particular
2033	2032	1	The paper "AAUX-2014" is mainly about AAUX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUX-2014 in particular
2036	1355	1	The paper "AAUY-2014" is mainly about AAUY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUY-2014 in particular
2040	895	1	The paper "AAUZ-2014" is mainly about AAUZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAUZ-2014 in particular
2058	1055	1	The paper "AAVA-2014" is mainly about AAVA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVA-2014 in particular
2067	450	1	The paper "AAVB-2014" is mainly about AAVB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVB-2014 in particular
2071	306	1	The paper "AAVC-2014" is mainly about AAVC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVC-2014 in particular
2074	552	1	The paper "AAVD-2014" is mainly about AAVD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVD-2014 in particular
2075	2076	1	The paper "AAVE-2014" is mainly about AAVE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVE-2014 in particular
2078	1415	1	The paper "AAVF-2014" is mainly about AAVF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVF-2014 in particular
2079	113	1	The paper "AAVG-2014" is mainly about AAVG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVG-2014 in particular
2083	2082	1	The paper "AAVH-2014" is mainly about AAVH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVH-2014 in particular
2084	2082	1	The paper "AAVI-2014" is mainly about AAVI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVI-2014 in particular
2085	2082	1	The paper "AAVJ-2014" is mainly about AAVJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVJ-2014 in particular
2086	1262	1	The paper "AAVK-2014" is mainly about AAVK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVK-2014 in particular
2093	107	1	The paper "AAVL-2014" is mainly about AAVL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVL-2014 in particular
2097	2096	1	The paper "AAVM-2014" is mainly about AAVM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVM-2014 in particular
2099	2096	1	The paper "AAVN-2014" is mainly about AAVN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVN-2014 in particular
2100	2096	1	The paper "AAVO-2014" is mainly about AAVO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVO-2014 in particular
2109	347	1	The paper "AAVP-2014" is mainly about AAVP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVP-2014 in particular
2116	2117	1	The paper "AAVQ-2014" is mainly about AAVQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVQ-2014 in particular
2124	2123	1	The paper "AAVR-2014" is mainly about AAVR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVR-2014 in particular
2130	2129	1	The paper "AAVS-2014" is mainly about AAVS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVS-2014 in particular
2131	1305	1	The paper "AAVT-2014" is mainly about AAVT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVT-2014 in particular
2138	333	1	The paper "AAVU-2014" is mainly about AAVU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVU-2014 in particular
2140	454	1	The paper "AAVV-2014" is mainly about AAVV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVV-2014 in particular
2148	2147	1	The paper "AAVW-2014" is mainly about AAVW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVW-2014 in particular
2149	39	1	The paper "AAVX-2014" is mainly about AAVX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVX-2014 in particular
2153	1473	1	The paper "AAVY-2014" is mainly about AAVY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVY-2014 in particular
2154	1473	1	The paper "AAVZ-2014" is mainly about AAVZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAVZ-2014 in particular
2156	768	1	The paper "AAWA-2014" is mainly about AAWA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWA-2014 in particular
2166	2167	1	The paper "AAWB-2014" is mainly about AAWB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWB-2014 in particular
2168	2117	1	The paper "AAWC-2014" is mainly about AAWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWC-2014 in particular
2172	128	1	The paper "AAWD-2014" is mainly about AAWD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWD-2014 in particular
2176	1398	1	The paper "AAWE-2014" is mainly about AAWE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWE-2014 in particular
2180	382	1	The paper "AAWF-2014" is mainly about AAWF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWF-2014 in particular
2182	1193	1	The paper "AAWG-2014" is mainly about AAWG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWG-2014 in particular
2184	1193	1	The paper "AAWH-2014" is mainly about AAWH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWH-2014 in particular
2185	1427	1	The paper "AAWI-2014" is mainly about AAWI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWI-2014 in particular
2186	1427	1	The paper "AAWJ-2014" is mainly about AAWJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWJ-2014 in particular
2187	1427	1	The paper "AAWK-2014" is mainly about AAWK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWK-2014 in particular
2190	326	1	The paper "AAWL-2014" is mainly about AAWL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWL-2014 in particular
2192	822	1	The paper "AAWM-2014" is mainly about AAWM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWM-2014 in particular
2193	822	1	The paper "AAWN-2014" is mainly about AAWN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWN-2014 in particular
2195	1054	1	The paper "AAWO-2014" is mainly about AAWO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWO-2014 in particular
2196	555	1	The paper "AAWP-2014" is mainly about AAWP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWP-2014 in particular
2203	2204	1	The paper "AAWQ-2014" is mainly about AAWQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWQ-2014 in particular
2206	2205	1	The paper "AAWR-2014" is mainly about AAWR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWR-2014 in particular
2207	343	1	The paper "AAWS-2014" is mainly about AAWS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWS-2014 in particular
2209	821	1	The paper "AAWT-2014" is mainly about AAWT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWT-2014 in particular
2210	1370	1	The paper "AAWU-2014" is mainly about AAWU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWU-2014 in particular
2211	1370	1	The paper "AAWV-2014" is mainly about AAWV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWV-2014 in particular
2214	942	1	The paper "AAWW-2014" is mainly about AAWW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWW-2014 in particular
2218	1867	1	The paper "AAWX-2014" is mainly about AAWX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWX-2014 in particular
2221	2061	1	The paper "AAWY-2014" is mainly about AAWY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWY-2014 in particular
2222	893	1	The paper "AAWZ-2014" is mainly about AAWZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAWZ-2014 in particular
2224	1855	1	The paper "AAXA-2014" is mainly about AAXA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXA-2014 in particular
2225	259	1	The paper "AAXB-2014" is mainly about AAXB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXB-2014 in particular
2230	1581	1	The paper "AAXC-2014" is mainly about AAXC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXC-2014 in particular
2232	623	1	The paper "AAXD-2014" is mainly about AAXD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXD-2014 in particular
2233	1568	1	The paper "AAXE-2014" is mainly about AAXE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXE-2014 in particular
2234	146	1	The paper "AAXF-2014" is mainly about AAXF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXF-2014 in particular
2236	1050	1	The paper "AAXG-2014" is mainly about AAXG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXG-2014 in particular
2237	1819	1	The paper "AAXH-2014" is mainly about AAXH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXH-2014 in particular
2238	323	1	The paper "AAXI-2014" is mainly about AAXI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXI-2014 in particular
2239	1300	1	The paper "AAXJ-2014" is mainly about AAXJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXJ-2014 in particular
2243	2244	1	The paper "AAXK-2014" is mainly about AAXK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXK-2014 in particular
2250	2251	1	The paper "AAXL-2014" is mainly about AAXL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXL-2014 in particular
2254	1409	1	The paper "AAXM-2014" is mainly about AAXM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXM-2014 in particular
2258	327	1	The paper "AAXN-2014" is mainly about AAXN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXN-2014 in particular
2259	1678	1	The paper "AAXO-2014" is mainly about AAXO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXO-2014 in particular
2267	180	1	The paper "AAXP-2014" is mainly about AAXP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXP-2014 in particular
2268	1142	1	The paper "AAXQ-2014" is mainly about AAXQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXQ-2014 in particular
2274	2272	1	The paper "AAXR-2014" is mainly about AAXR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXR-2014 in particular
2275	2272	1	The paper "AAXS-2014" is mainly about AAXS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXS-2014 in particular
2278	587	1	The paper "AAXT-2014" is mainly about AAXT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXT-2014 in particular
2280	2279	1	The paper "AAXU-2014" is mainly about AAXU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXU-2014 in particular
2290	1466	1	The paper "AAXV-2014" is mainly about AAXV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXV-2014 in particular
2293	332	1	The paper "AAXW-2014" is mainly about AAXW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXW-2014 in particular
2294	555	1	The paper "AAXX-2014" is mainly about AAXX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXX-2014 in particular
2297	1274	1	The paper "AAXY-2014" is mainly about AAXY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXY-2014 in particular
2301	2302	1	The paper "AAXZ-2014" is mainly about AAXZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAXZ-2014 in particular
2303	720	1	The paper "AAYA-2014" is mainly about AAYA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYA-2014 in particular
2304	720	1	The paper "AAYB-2014" is mainly about AAYB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYB-2014 in particular
2305	720	1	The paper "AAYC-2014" is mainly about AAYC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYC-2014 in particular
2308	1352	1	The paper "AAYD-2014" is mainly about AAYD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYD-2014 in particular
2311	2312	1	The paper "AAYE-2014" is mainly about AAYE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYE-2014 in particular
2314	449	1	The paper "AAYF-2014" is mainly about AAYF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYF-2014 in particular
2317	131	1	The paper "AAYG-2014" is mainly about AAYG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYG-2014 in particular
2318	155	1	The paper "AAYH-2014" is mainly about AAYH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYH-2014 in particular
2322	2323	1	The paper "AAYI-2014" is mainly about AAYI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYI-2014 in particular
2325	2202	1	The paper "AAYJ-2014" is mainly about AAYJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYJ-2014 in particular
2332	604	1	The paper "AAYK-2014" is mainly about AAYK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYK-2014 in particular
2344	2345	1	The paper "AAYL-2014" is mainly about AAYL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYL-2014 in particular
2347	1711	1	The paper "AAYM-2014" is mainly about AAYM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYM-2014 in particular
2348	1602	1	The paper "AAYN-2014" is mainly about AAYN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYN-2014 in particular
2353	20	1	The paper "AAYO-2014" is mainly about AAYO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYO-2014 in particular
2357	51	1	The paper "AAYP-2014" is mainly about AAYP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYP-2014 in particular
2362	289	1	The paper "AAYQ-2014" is mainly about AAYQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYQ-2014 in particular
2363	289	1	The paper "AAYR-2014" is mainly about AAYR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYR-2014 in particular
2368	2066	1	The paper "AAYS-2014" is mainly about AAYS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYS-2014 in particular
2372	468	1	The paper "AAYT-2014" is mainly about AAYT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYT-2014 in particular
2373	2374	1	The paper "AAYU-2014" is mainly about AAYU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYU-2014 in particular
2375	2270	1	The paper "AAYV-2014" is mainly about AAYV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYV-2014 in particular
2379	1466	1	The paper "AAYW-2014" is mainly about AAYW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYW-2014 in particular
2381	2382	1	The paper "AAYX-2014" is mainly about AAYX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYX-2014 in particular
2387	2360	1	The paper "AAYY-2014" is mainly about AAYY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYY-2014 in particular
2392	451	1	The paper "AAYZ-2014" is mainly about AAYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAYZ-2014 in particular
2393	113	1	The paper "AAZA-2014" is mainly about AAZA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZA-2014 in particular
2394	113	1	The paper "AAZB-2014" is mainly about AAZB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZB-2014 in particular
2396	1310	1	The paper "AAZC-2014" is mainly about AAZC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZC-2014 in particular
2400	261	1	The paper "AAZD-2014" is mainly about AAZD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZD-2014 in particular
2403	2404	1	The paper "AAZE-2014" is mainly about AAZE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZE-2014 in particular
2407	2408	1	The paper "AAZF-2014" is mainly about AAZF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZF-2014 in particular
2410	30	1	The paper "AAZG-2014" is mainly about AAZG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZG-2014 in particular
2411	2118	1	The paper "AAZH-2014" is mainly about AAZH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZH-2014 in particular
2413	2159	1	The paper "AAZI-2014" is mainly about AAZI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZI-2014 in particular
2414	813	1	The paper "AAZJ-2014" is mainly about AAZJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZJ-2014 in particular
2415	2416	1	The paper "AAZK-2014" is mainly about AAZK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZK-2014 in particular
2417	1829	1	The paper "AAZL-2014" is mainly about AAZL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZL-2014 in particular
2421	2420	1	The paper "AAZM-2014" is mainly about AAZM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZM-2014 in particular
2422	2423	1	The paper "AAZN-2014" is mainly about AAZN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZN-2014 in particular
2429	1186	1	The paper "AAZO-2014" is mainly about AAZO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZO-2014 in particular
2432	2431	1	The paper "AAZP-2014" is mainly about AAZP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZP-2014 in particular
2435	466	1	The paper "AAZQ-2014" is mainly about AAZQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZQ-2014 in particular
2437	1053	1	The paper "AAZR-2014" is mainly about AAZR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZR-2014 in particular
2439	1726	1	The paper "AAZS-2014" is mainly about AAZS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZS-2014 in particular
2440	702	1	The paper "AAZT-2014" is mainly about AAZT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZT-2014 in particular
2441	46	1	The paper "AAZU-2014" is mainly about AAZU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZU-2014 in particular
2442	1968	1	The paper "AAZV-2014" is mainly about AAZV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZV-2014 in particular
2444	585	1	The paper "AAZW-2014" is mainly about AAZW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZW-2014 in particular
2445	2026	1	The paper "AAZX-2014" is mainly about AAZX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZX-2014 in particular
2446	2026	1	The paper "AAZY-2014" is mainly about AAZY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZY-2014 in particular
2448	2449	1	The paper "AAZZ-2014" is mainly about AAZZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight AAZZ-2014 in particular
2450	2425	1	The paper "ABAA-2014" is mainly about ABAA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAA-2014 in particular
2454	2453	1	The paper "ABAB-2014" is mainly about ABAB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAB-2014 in particular
2455	1517	1	The paper "ABAC-2014" is mainly about ABAC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAC-2014 in particular
2456	629	1	The paper "ABAD-2014" is mainly about ABAD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAD-2014 in particular
2459	1416	1	The paper "ABAE-2014" is mainly about ABAE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAE-2014 in particular
2461	2043	1	The paper "ABAF-2014" is mainly about ABAF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAF-2014 in particular
2462	1055	1	The paper "ABAG-2014" is mainly about ABAG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAG-2014 in particular
2463	1475	1	The paper "ABAH-2014" is mainly about ABAH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAH-2014 in particular
2464	1417	1	The paper "ABAI-2014" is mainly about ABAI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAI-2014 in particular
2465	341	1	The paper "ABAJ-2014" is mainly about ABAJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAJ-2014 in particular
2467	1179	1	The paper "ABAK-2014" is mainly about ABAK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAK-2014 in particular
2470	2469	1	The paper "ABAL-2014" is mainly about ABAL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAL-2014 in particular
2475	1382	1	The paper "ABAM-2014" is mainly about ABAM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAM-2014 in particular
2478	196	1	The paper "ABAN-2014" is mainly about ABAN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAN-2014 in particular
2482	727	1	The paper "ABAO-2014" is mainly about ABAO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAO-2014 in particular
2485	2173	1	The paper "ABAP-2014" is mainly about ABAP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAP-2014 in particular
2488	342	1	The paper "ABAQ-2014" is mainly about ABAQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAQ-2014 in particular
2493	1993	1	The paper "ABAR-2014" is mainly about ABAR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAR-2014 in particular
2496	451	1	The paper "ABAS-2014" is mainly about ABAS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAS-2014 in particular
2499	2341	1	The paper "ABAT-2014" is mainly about ABAT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAT-2014 in particular
2502	2142	1	The paper "ABAU-2014" is mainly about ABAU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAU-2014 in particular
2506	1472	1	The paper "ABAV-2014" is mainly about ABAV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAV-2014 in particular
2516	1048	1	The paper "ABAW-2014" is mainly about ABAW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAW-2014 in particular
2522	51	1	The paper "ABAX-2014" is mainly about ABAX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAX-2014 in particular
2523	203	1	The paper "ABAY-2014" is mainly about ABAY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAY-2014 in particular
2526	1343	1	The paper "ABAZ-2014" is mainly about ABAZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABAZ-2014 in particular
2530	336	1	The paper "ABBA-2014" is mainly about ABBA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBA-2014 in particular
2537	2178	1	The paper "ABBB-2014" is mainly about ABBB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBB-2014 in particular
2539	629	1	The paper "ABBC-2014" is mainly about ABBC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBC-2014 in particular
2540	629	1	The paper "ABBD-2014" is mainly about ABBD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBD-2014 in particular
2545	1068	1	The paper "ABBE-2014" is mainly about ABBE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBE-2014 in particular
2559	1156	1	The paper "ABBF-2014" is mainly about ABBF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBF-2014 in particular
2561	2330	1	The paper "ABBG-2014" is mainly about ABBG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBG-2014 in particular
2564	821	1	The paper "ABBH-2014" is mainly about ABBH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBH-2014 in particular
2569	1058	1	The paper "ABBI-2014" is mainly about ABBI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBI-2014 in particular
2573	225	1	The paper "ABBJ-2014" is mainly about ABBJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBJ-2014 in particular
2575	2408	1	The paper "ABBK-2014" is mainly about ABBK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBK-2014 in particular
2576	1664	1	The paper "ABBL-2014" is mainly about ABBL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBL-2014 in particular
2577	331	1	The paper "ABBM-2014" is mainly about ABBM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBM-2014 in particular
2578	344	1	The paper "ABBN-2014" is mainly about ABBN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBN-2014 in particular
2580	29	1	The paper "ABBO-2014" is mainly about ABBO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBO-2014 in particular
2582	735	1	The paper "ABBP-2014" is mainly about ABBP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBP-2014 in particular
2596	330	1	The paper "ABBQ-2014" is mainly about ABBQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBQ-2014 in particular
2597	819	1	The paper "ABBR-2014" is mainly about ABBR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBR-2014 in particular
2599	2350	1	The paper "ABBS-2014" is mainly about ABBS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBS-2014 in particular
2601	1300	1	The paper "ABBT-2014" is mainly about ABBT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBT-2014 in particular
2604	2065	1	The paper "ABBU-2014" is mainly about ABBU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBU-2014 in particular
2605	291	1	The paper "ABBV-2014" is mainly about ABBV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBV-2014 in particular
2608	2060	1	The paper "ABBW-2014" is mainly about ABBW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBW-2014 in particular
2610	1192	1	The paper "ABBX-2014" is mainly about ABBX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBX-2014 in particular
2611	2227	1	The paper "ABBY-2014" is mainly about ABBY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBY-2014 in particular
2615	337	1	The paper "ABBZ-2014" is mainly about ABBZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABBZ-2014 in particular
2616	1225	1	The paper "ABCA-2014" is mainly about ABCA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCA-2014 in particular
2621	883	1	The paper "ABCB-2014" is mainly about ABCB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCB-2014 in particular
2625	1993	1	The paper "ABCC-2014" is mainly about ABCC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCC-2014 in particular
2627	303	1	The paper "ABCD-2014" is mainly about ABCD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCD-2014 in particular
2629	819	1	The paper "ABCE-2014" is mainly about ABCE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCE-2014 in particular
2630	701	1	The paper "ABCF-2014" is mainly about ABCF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCF-2014 in particular
2631	701	1	The paper "ABCG-2014" is mainly about ABCG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCG-2014 in particular
2632	701	1	The paper "ABCH-2014" is mainly about ABCH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCH-2014 in particular
2633	1690	1	The paper "ABCI-2014" is mainly about ABCI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCI-2014 in particular
2634	2159	1	The paper "ABCJ-2014" is mainly about ABCJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCJ-2014 in particular
2635	1274	1	The paper "ABCK-2014" is mainly about ABCK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCK-2014 in particular
2637	2638	1	The paper "ABCL-2014" is mainly about ABCL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCL-2014 in particular
2639	2341	1	The paper "ABCM-2014" is mainly about ABCM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCM-2014 in particular
2640	196	1	The paper "ABCN-2014" is mainly about ABCN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCN-2014 in particular
2642	711	1	The paper "ABCO-2014" is mainly about ABCO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCO-2014 in particular
2643	2300	1	The paper "ABCP-2014" is mainly about ABCP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCP-2014 in particular
2645	1429	1	The paper "ABCQ-2014" is mainly about ABCQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCQ-2014 in particular
2646	2491	1	The paper "ABCR-2014" is mainly about ABCR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCR-2014 in particular
2647	449	1	The paper "ABCS-2014" is mainly about ABCS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCS-2014 in particular
2649	1052	1	The paper "ABCT-2014" is mainly about ABCT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCT-2014 in particular
2652	1666	1	The paper "ABCU-2014" is mainly about ABCU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCU-2014 in particular
2653	50	1	The paper "ABCV-2014" is mainly about ABCV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCV-2014 in particular
2656	2655	1	The paper "ABCW-2014" is mainly about ABCW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCW-2014 in particular
2658	20	1	The paper "ABCX-2014" is mainly about ABCX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCX-2014 in particular
2664	777	1	The paper "ABCY-2014" is mainly about ABCY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCY-2014 in particular
2667	51	1	The paper "ABCZ-2014" is mainly about ABCZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABCZ-2014 in particular
2668	2669	1	The paper "ABDA-2014" is mainly about ABDA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDA-2014 in particular
2672	1503	1	The paper "ABDB-2014" is mainly about ABDB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDB-2014 in particular
2673	777	1	The paper "ABDC-2014" is mainly about ABDC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDC-2014 in particular
2675	1737	1	The paper "ABDD-2014" is mainly about ABDD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDD-2014 in particular
2676	606	1	The paper "ABDE-2014" is mainly about ABDE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDE-2014 in particular
2680	2679	1	The paper "ABDF-2014" is mainly about ABDF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDF-2014 in particular
2681	2008	1	The paper "ABDG-2014" is mainly about ABDG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDG-2014 in particular
2688	642	1	The paper "ABDH-2014" is mainly about ABDH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDH-2014 in particular
2694	908	1	The paper "ABDI-2014" is mainly about ABDI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDI-2014 in particular
2695	908	1	The paper "ABDJ-2014" is mainly about ABDJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDJ-2014 in particular
2698	1260	1	The paper "ABDK-2014" is mainly about ABDK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDK-2014 in particular
2702	2051	1	The paper "ABDL-2014" is mainly about ABDL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDL-2014 in particular
2703	2491	1	The paper "ABDM-2014" is mainly about ABDM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDM-2014 in particular
2707	1049	1	The paper "ABDN-2014" is mainly about ABDN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDN-2014 in particular
2710	809	1	The paper "ABDO-2014" is mainly about ABDO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDO-2014 in particular
2713	196	1	The paper "ABDP-2014" is mainly about ABDP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDP-2014 in particular
2718	212	1	The paper "ABDQ-2014" is mainly about ABDQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDQ-2014 in particular
2724	1098	1	The paper "ABDR-2014" is mainly about ABDR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDR-2014 in particular
2727	1813	1	The paper "ABDS-2014" is mainly about ABDS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDS-2014 in particular
2734	585	1	The paper "ABDT-2014" is mainly about ABDT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDT-2014 in particular
2744	689	1	The paper "ABDU-2014" is mainly about ABDU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDU-2014 in particular
2745	1419	1	The paper "ABDV-2014" is mainly about ABDV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDV-2014 in particular
2748	1410	1	The paper "ABDW-2014" is mainly about ABDW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDW-2014 in particular
2752	2753	1	The paper "ABDX-2014" is mainly about ABDX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDX-2014 in particular
2755	20	1	The paper "ABDY-2014" is mainly about ABDY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDY-2014 in particular
2757	2004	1	The paper "ABDZ-2014" is mainly about ABDZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABDZ-2014 in particular
2760	1459	1	The paper "ABEA-2014" is mainly about ABEA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEA-2014 in particular
2767	468	1	The paper "ABEB-2014" is mainly about ABEB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEB-2014 in particular
2768	2158	1	The paper "ABEC-2014" is mainly about ABEC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEC-2014 in particular
2771	560	1	The paper "ABED-2014" is mainly about ABED-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABED-2014 in particular
2775	2145	1	The paper "ABEE-2014" is mainly about ABEE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEE-2014 in particular
2778	1475	1	The paper "ABEF-2014" is mainly about ABEF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEF-2014 in particular
2780	84	1	The paper "ABEG-2014" is mainly about ABEG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEG-2014 in particular
2784	1561	1	The paper "ABEH-2014" is mainly about ABEH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEH-2014 in particular
2786	1352	1	The paper "ABEI-2014" is mainly about ABEI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEI-2014 in particular
2787	1092	1	The paper "ABEJ-2014" is mainly about ABEJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEJ-2014 in particular
2790	1301	1	The paper "ABEK-2014" is mainly about ABEK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEK-2014 in particular
2791	47	1	The paper "ABEL-2014" is mainly about ABEL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEL-2014 in particular
2792	1759	1	The paper "ABEM-2014" is mainly about ABEM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEM-2014 in particular
2793	1045	1	The paper "ABEN-2014" is mainly about ABEN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEN-2014 in particular
2795	2228	1	The paper "ABEO-2014" is mainly about ABEO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEO-2014 in particular
2796	1759	1	The paper "ABEP-2014" is mainly about ABEP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEP-2014 in particular
2801	1411	1	The paper "ABEQ-2014" is mainly about ABEQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEQ-2014 in particular
2803	334	1	The paper "ABER-2014" is mainly about ABER-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABER-2014 in particular
2807	2398	1	The paper "ABES-2014" is mainly about ABES-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABES-2014 in particular
2808	2662	1	The paper "ABET-2014" is mainly about ABET-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABET-2014 in particular
2810	2145	1	The paper "ABEU-2014" is mainly about ABEU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEU-2014 in particular
2811	1530	1	The paper "ABEV-2014" is mainly about ABEV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEV-2014 in particular
2813	1351	1	The paper "ABEW-2014" is mainly about ABEW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEW-2014 in particular
2814	874	1	The paper "ABEX-2014" is mainly about ABEX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEX-2014 in particular
2815	459	1	The paper "ABEY-2014" is mainly about ABEY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEY-2014 in particular
2826	1254	1	The paper "ABEZ-2014" is mainly about ABEZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABEZ-2014 in particular
2827	1254	1	The paper "ABFA-2014" is mainly about ABFA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFA-2014 in particular
2830	2831	1	The paper "ABFB-2014" is mainly about ABFB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFB-2014 in particular
2833	29	1	The paper "ABFC-2014" is mainly about ABFC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFC-2014 in particular
2837	2137	1	The paper "ABFD-2014" is mainly about ABFD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFD-2014 in particular
2838	2229	1	The paper "ABFE-2014" is mainly about ABFE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFE-2014 in particular
2864	454	1	The paper "ABFF-2014" is mainly about ABFF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFF-2014 in particular
2869	1437	1	The paper "ABFG-2014" is mainly about ABFG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFG-2014 in particular
2873	584	1	The paper "ABFH-2014" is mainly about ABFH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFH-2014 in particular
2874	1419	1	The paper "ABFI-2014" is mainly about ABFI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFI-2014 in particular
2893	821	1	The paper "ABFJ-2014" is mainly about ABFJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFJ-2014 in particular
2894	2070	1	The paper "ABFK-2014" is mainly about ABFK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFK-2014 in particular
2896	2063	1	The paper "ABFL-2014" is mainly about ABFL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFL-2014 in particular
2898	47	1	The paper "ABFM-2014" is mainly about ABFM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFM-2014 in particular
2900	355	1	The paper "ABFN-2014" is mainly about ABFN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFN-2014 in particular
2902	272	1	The paper "ABFO-2014" is mainly about ABFO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFO-2014 in particular
2907	1322	1	The paper "ABFP-2014" is mainly about ABFP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFP-2014 in particular
2912	290	1	The paper "ABFQ-2014" is mainly about ABFQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFQ-2014 in particular
2914	778	1	The paper "ABFR-2014" is mainly about ABFR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFR-2014 in particular
2916	459	1	The paper "ABFS-2014" is mainly about ABFS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFS-2014 in particular
2917	2055	1	The paper "ABFT-2014" is mainly about ABFT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFT-2014 in particular
2918	2244	1	The paper "ABFU-2014" is mainly about ABFU-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFU-2014 in particular
2919	1025	1	The paper "ABFV-2014" is mainly about ABFV-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFV-2014 in particular
2923	1719	1	The paper "ABFW-2014" is mainly about ABFW-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFW-2014 in particular
2932	642	1	The paper "ABFX-2014" is mainly about ABFX-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFX-2014 in particular
2936	433	1	The paper "ABFY-2014" is mainly about ABFY-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFY-2014 in particular
2939	1098	1	The paper "ABFZ-2014" is mainly about ABFZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABFZ-2014 in particular
2943	936	1	The paper "ABGA-2014" is mainly about ABGA-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGA-2014 in particular
2944	936	1	The paper "ABGB-2014" is mainly about ABGB-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGB-2014 in particular
2947	1602	1	The paper "ABGC-2014" is mainly about ABGC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGC-2014 in particular
2950	2160	1	The paper "ABGD-2014" is mainly about ABGD-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGD-2014 in particular
2956	2282	1	The paper "ABGE-2014" is mainly about ABGE-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGE-2014 in particular
2957	1591	1	The paper "ABGF-2014" is mainly about ABGF-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGF-2014 in particular
2958	2091	1	The paper "ABGG-2014" is mainly about ABGG-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGG-2014 in particular
2965	1467	1	The paper "ABGH-2014" is mainly about ABGH-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGH-2014 in particular
2967	21	1	The paper "ABGI-2014" is mainly about ABGI-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGI-2014 in particular
2969	2064	1	The paper "ABGJ-2014" is mainly about ABGJ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGJ-2014 in particular
2970	2612	1	The paper "ABGK-2014" is mainly about ABGK-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGK-2014 in particular
2983	1106	1	The paper "ABGL-2014" is mainly about ABGL-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGL-2014 in particular
3001	2160	1	The paper "ABGM-2014" is mainly about ABGM-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGM-2014 in particular
3003	2926	1	The paper "ABGN-2014" is mainly about ABGN-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGN-2014 in particular
3015	1467	1	The paper "ABGO-2014" is mainly about ABGO-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGO-2014 in particular
3018	2587	1	The paper "ABGP-2014" is mainly about ABGP-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGP-2014 in particular
3026	808	1	The paper "ABGQ-2014" is mainly about ABGQ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGQ-2014 in particular
3034	346	1	The paper "ABGR-2014" is mainly about ABGR-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGR-2014 in particular
3035	2160	1	The paper "ABGS-2014" is mainly about ABGS-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGS-2014 in particular
3038	1051	1	The paper "ABGT-2014" is mainly about ABGT-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ABGT-2014 in particular
\.



COPY "Paper" ("ID", "paperID", "rejectedBy", "readByMeta-Reviewer", "hasAuthor", title, "hasDecision", "acceptedBy", "TYPE", "Reviewer") FROM stdin;
505	1687	\N	\N	504	mohairs admiralties bewigged playgoers	\N	\N	2	1485
505	1687	\N	\N	504	mohairs admiralties bewigged playgoers	\N	\N	2	1507
1	987	\N	\N	0	labium peeped daydreams permuting immediately canzona interrelated cooked	\N	\N	2	290
1	987	\N	\N	0	labium peeped daydreams permuting immediately canzona interrelated cooked	\N	\N	2	986
4	3014	\N	\N	641	timbrel presell woodcraft reupholstered xerosis steamers	\N	\N	2	2
4	3014	\N	\N	641	timbrel presell woodcraft reupholstered xerosis steamers	\N	\N	2	642
8	672	\N	\N	674	isolators reducing nethermost nonfiction	\N	\N	2	5
8	672	\N	\N	674	isolators reducing nethermost nonfiction	\N	\N	2	675
9	2542	\N	\N	674	satisfying undamped sharpers forbearer	\N	\N	2	5
9	2542	\N	\N	674	satisfying undamped sharpers forbearer	\N	\N	2	217
12	920	\N	\N	674	neologic intermuscular fobbed transcribed swifters redigesting	\N	\N	2	5
12	920	\N	\N	674	neologic intermuscular fobbed transcribed swifters redigesting	\N	\N	2	217
14	2492	\N	\N	2339	regainers teardown margarins inconvenience triunities	\N	\N	2	137
14	2492	\N	\N	2339	regainers teardown margarins inconvenience triunities	\N	\N	2	581
15	3036	\N	\N	2339	occulters blubberer amenities desecrated	\N	\N	2	137
15	3036	\N	\N	2339	occulters blubberer amenities desecrated	\N	\N	2	581
16	18	\N	\N	21	effulgences coreless tuberculoses environs	\N	\N	2	17
16	18	\N	\N	21	effulgences coreless tuberculoses environs	\N	\N	2	20
25	26	\N	\N	28	sharpers forbearer anesthetization undermentioned outflanking	\N	\N	2	27
25	26	\N	\N	28	sharpers forbearer anesthetization undermentioned outflanking	\N	\N	2	29
33	3076	\N	\N	273	bounden occulters blubberer amenities desecrated tetrachlorides loutish	\N	\N	2	31
33	3076	\N	\N	273	bounden occulters blubberer amenities desecrated tetrachlorides loutish	\N	\N	2	998
34	37	\N	\N	36	danker raunchiness perspicuously disjoined	\N	\N	2	35
34	37	\N	\N	36	danker raunchiness perspicuously disjoined	\N	\N	2	39
43	44	\N	\N	48	firefanged skeins equalled sandwiching bewitchment cheaters	\N	\N	2	45
43	44	\N	\N	48	firefanged skeins equalled sandwiching bewitchment cheaters	\N	\N	2	47
49	52	\N	\N	53	dissociated heartier petitionee brill	\N	\N	2	50
49	52	\N	\N	53	dissociated heartier petitionee brill	\N	\N	2	51
59	1746	\N	\N	587	latchets inflecting trephines hops exec junketeers isolators reducing	\N	\N	2	57
59	1746	\N	\N	587	latchets inflecting trephines hops exec junketeers isolators reducing	\N	\N	2	584
62	65	\N	\N	66	evasiveness toto teashop reaccepts gunneries exorcises pirog desexes	\N	\N	2	63
62	65	\N	\N	66	evasiveness toto teashop reaccepts gunneries exorcises pirog desexes	\N	\N	2	64
72	2777	\N	\N	337	slavishly hipless prs bluejays cuppier nonsurgical	\N	\N	2	71
72	2777	\N	\N	337	slavishly hipless prs bluejays cuppier nonsurgical	\N	\N	2	2469
76	1816	\N	\N	749	ostinato recalculation safest signiory latchets inflecting trephines hops exec	\N	\N	2	1000
76	1816	\N	\N	749	ostinato recalculation safest signiory latchets inflecting trephines hops exec	\N	\N	2	1427
77	1280	\N	\N	337	interrelated cooked reformers goodwife technicolor plenishes nippy	\N	\N	2	71
77	1280	\N	\N	337	interrelated cooked reformers goodwife technicolor plenishes nippy	\N	\N	2	727
78	2430	\N	\N	337	cancels debiting parrots paraguayans resonates overbites	\N	\N	2	71
78	2430	\N	\N	337	cancels debiting parrots paraguayans resonates overbites	\N	\N	2	727
80	2848	\N	\N	749	outflanking funnyman commuted lachrymation floweret arcadian acridities	\N	\N	2	1000
80	2848	\N	\N	749	outflanking funnyman commuted lachrymation floweret arcadian acridities	\N	\N	2	1427
81	85	\N	\N	82	teratoid coadjutors thuggeries nondestructive maladjustments	\N	\N	2	84
81	85	\N	\N	82	teratoid coadjutors thuggeries nondestructive maladjustments	\N	\N	2	86
89	94	\N	\N	91	bigamistic furrows eloquence cobwebbier divorcing incidentally retorts insoles stockman	\N	\N	2	90
89	94	\N	\N	91	bigamistic furrows eloquence cobwebbier divorcing incidentally retorts insoles stockman	\N	\N	2	92
103	2175	\N	\N	1255	inadvisability disciplinarians majors manifestly decaffeinates scalepan	\N	\N	2	101
103	2175	\N	\N	1255	inadvisability disciplinarians majors manifestly decaffeinates scalepan	\N	\N	2	2173
105	202	\N	\N	104	agric proliferating disintegrator oblongish leapfrogged overabundant legworks	\N	\N	2	200
105	202	\N	\N	104	agric proliferating disintegrator oblongish leapfrogged overabundant legworks	\N	\N	2	203
108	109	\N	\N	111	nigglings midmonths labium peeped daydreams permuting immediately canzona	\N	\N	2	110
108	109	\N	\N	111	nigglings midmonths labium peeped daydreams permuting immediately canzona	\N	\N	2	113
114	117	\N	\N	116	nonliving agric proliferating disintegrator oblongish leapfrogged	\N	\N	2	115
114	117	\N	\N	116	nonliving agric proliferating disintegrator oblongish leapfrogged	\N	\N	2	119
124	2120	\N	\N	123	hearings legation subendorsed hippocampus miscalculates	\N	\N	2	476
124	2120	\N	\N	123	hearings legation subendorsed hippocampus miscalculates	\N	\N	2	2118
127	132	\N	\N	130	yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments	\N	\N	2	128
127	132	\N	\N	130	yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments	\N	\N	2	129
142	145	\N	\N	146	technicolor plenishes nippy bounden occulters blubberer amenities desecrated	\N	\N	2	143
142	145	\N	\N	146	technicolor plenishes nippy bounden occulters blubberer amenities desecrated	\N	\N	2	144
151	152	\N	\N	155	gaudiness irades inadvisability disciplinarians majors manifestly decaffeinates scalepan folklorists	\N	\N	2	88
151	152	\N	\N	155	gaudiness irades inadvisability disciplinarians majors manifestly decaffeinates scalepan folklorists	\N	\N	2	153
160	2883	\N	\N	2624	majors manifestly decaffeinates scalepan folklorists attractive yeller cognizably	\N	\N	2	158
160	2883	\N	\N	2624	majors manifestly decaffeinates scalepan folklorists attractive yeller cognizably	\N	\N	2	1417
164	2825	\N	\N	346	preheats loggias reconciliating photocatalyst lenity tautological jambing	\N	\N	2	161
164	2825	\N	\N	346	preheats loggias reconciliating photocatalyst lenity tautological jambing	\N	\N	2	180
165	783	\N	\N	782	intermuscular fobbed transcribed swifters redigesting	\N	\N	2	177
165	783	\N	\N	782	intermuscular fobbed transcribed swifters redigesting	\N	\N	2	784
167	1371	\N	\N	346	isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids	\N	\N	2	161
167	1371	\N	\N	346	isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids	\N	\N	2	180
173	2885	\N	\N	2886	leviathans misadvised tiltyard numberable yawing prosecutrices	\N	\N	2	149
173	2885	\N	\N	2886	leviathans misadvised tiltyard numberable yawing prosecutrices	\N	\N	2	171
175	178	\N	\N	179	oralogy tibetans slavishly hipless prs	\N	\N	2	176
175	178	\N	\N	179	oralogy tibetans slavishly hipless prs	\N	\N	2	177
185	2959	\N	\N	184	succories dwelling scrapped prat islanded burlily thanklessly	\N	\N	2	743
185	2959	\N	\N	184	succories dwelling scrapped prat islanded burlily thanklessly	\N	\N	2	1593
188	2908	\N	\N	2235	unitarians reevaluate rekeys ochroid climatotherapy crocks carpetbag	\N	\N	2	186
188	2908	\N	\N	2235	unitarians reevaluate rekeys ochroid climatotherapy crocks carpetbag	\N	\N	2	1061
190	2666	\N	\N	189	islanded burlily thanklessly swiveled polers oinked apnea maxillary dumpers	\N	\N	2	1108
190	2666	\N	\N	189	islanded burlily thanklessly swiveled polers oinked apnea maxillary dumpers	\N	\N	2	1142
191	2705	\N	\N	189	pirog desexes summable heliocentricity excretions recelebrating	\N	\N	2	1084
191	2705	\N	\N	189	pirog desexes summable heliocentricity excretions recelebrating	\N	\N	2	1142
194	198	\N	\N	195	stollens ponderers conditione loathly cancels debiting	\N	\N	2	196
194	198	\N	\N	195	stollens ponderers conditione loathly cancels debiting	\N	\N	2	197
207	224	\N	\N	226	succulently marquise underlaid neurosurgeon	\N	\N	2	205
207	224	\N	\N	226	succulently marquise underlaid neurosurgeon	\N	\N	2	225
210	3078	\N	\N	1476	napoleons rifer splinting surmisers	\N	\N	2	107
210	3078	\N	\N	1476	napoleons rifer splinting surmisers	\N	\N	2	1739
211	216	\N	\N	215	jigsawed kickstands prated songstresses	\N	\N	2	212
211	216	\N	\N	215	jigsawed kickstands prated songstresses	\N	\N	2	214
220	1075	\N	\N	674	stollens ponderers conditione loathly cancels	\N	\N	2	30
220	1075	\N	\N	674	stollens ponderers conditione loathly cancels	\N	\N	2	777
221	2849	\N	\N	674	daydreams permuting immediately canzona interrelated cooked	\N	\N	2	30
221	2849	\N	\N	674	daydreams permuting immediately canzona interrelated cooked	\N	\N	2	777
229	2037	\N	\N	337	anesthetization undermentioned outflanking funnyman commuted lachrymation	\N	\N	2	228
506	3023	\N	\N	504	terminals giros podgy vagus kinkiest	\N	\N	2	1101
229	2037	\N	\N	337	anesthetization undermentioned outflanking funnyman commuted lachrymation	\N	\N	2	1225
231	2324	\N	\N	337	lenity tautological jambing sodality outcrop slipcases	\N	\N	2	228
231	2324	\N	\N	337	lenity tautological jambing sodality outcrop slipcases	\N	\N	2	1702
232	3019	\N	\N	337	swifters redigesting ostinato recalculation safest signiory latchets inflecting	\N	\N	2	228
232	3019	\N	\N	337	swifters redigesting ostinato recalculation safest signiory latchets inflecting	\N	\N	2	1225
239	2340	\N	\N	238	danker raunchiness perspicuously disjoined nigglings midmonths	\N	\N	2	1279
239	2340	\N	\N	238	danker raunchiness perspicuously disjoined nigglings midmonths	\N	\N	2	2341
240	2602	\N	\N	816	prs bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	238
240	2602	\N	\N	816	prs bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	1664
241	2337	\N	\N	238	thoughtless elation swampland earings circumscribed paralyzingly	\N	\N	2	1602
241	2337	\N	\N	238	thoughtless elation swampland earings circumscribed paralyzingly	\N	\N	2	1690
242	2524	\N	\N	238	technicolor plenishes nippy bounden occulters blubberer	\N	\N	2	1223
242	2524	\N	\N	238	technicolor plenishes nippy bounden occulters blubberer	\N	\N	2	2341
244	2401	\N	\N	238	yabber reprovingly blungers dwarflike effulgences	\N	\N	2	1602
244	2401	\N	\N	238	yabber reprovingly blungers dwarflike effulgences	\N	\N	2	1690
247	1497	\N	\N	1496	forfends voucherable intercepting jeered immunopathology	\N	\N	2	245
247	1497	\N	\N	1496	forfends voucherable intercepting jeered immunopathology	\N	\N	2	980
249	2146	\N	\N	1071	subpartnership cordilleras recirculations alkalin succulently	\N	\N	2	248
249	2146	\N	\N	1071	subpartnership cordilleras recirculations alkalin succulently	\N	\N	2	2145
250	2378	\N	\N	1070	margarins inconvenience triunities dipped votarists	\N	\N	2	248
250	2378	\N	\N	1070	margarins inconvenience triunities dipped votarists	\N	\N	2	1213
252	2696	\N	\N	1071	dismounting endorser libations harrower claymores shiftlessly	\N	\N	2	248
252	2696	\N	\N	1071	dismounting endorser libations harrower claymores shiftlessly	\N	\N	2	2145
256	258	\N	\N	259	gasogenes obnoxiously dismounting endorser libations harrower claymores	\N	\N	2	260
256	258	\N	\N	259	gasogenes obnoxiously dismounting endorser libations harrower claymores	\N	\N	2	261
265	2240	\N	\N	2241	nonliving agric proliferating disintegrator oblongish leapfrogged overabundant	\N	\N	2	262
265	2240	\N	\N	2241	nonliving agric proliferating disintegrator oblongish leapfrogged overabundant	\N	\N	2	830
266	2335	\N	\N	2241	zinged fridge stained unintentional	\N	\N	2	262
266	2335	\N	\N	2241	zinged fridge stained unintentional	\N	\N	2	1939
268	269	\N	\N	273	outpoured dissociated heartier petitionee brill neologic intermuscular	\N	\N	2	271
268	269	\N	\N	273	outpoured dissociated heartier petitionee brill neologic intermuscular	\N	\N	2	272
284	2865	\N	\N	1594	miscalling firefanged skeins equalled sandwiching bewitchment cheaters	\N	\N	2	1260
284	2865	\N	\N	1594	miscalling firefanged skeins equalled sandwiching bewitchment cheaters	\N	\N	2	1744
287	292	\N	\N	290	tetrachlorides loutish polygony malines	\N	\N	2	288
287	292	\N	\N	290	tetrachlorides loutish polygony malines	\N	\N	2	289
298	3074	\N	\N	336	nonspecialized vrouw squads tantalums	\N	\N	2	295
298	3074	\N	\N	336	nonspecialized vrouw squads tantalums	\N	\N	2	2158
299	2598	\N	\N	336	embrocation casteless uroliths sashes marrieds fungic	\N	\N	2	295
299	2598	\N	\N	336	embrocation casteless uroliths sashes marrieds fungic	\N	\N	2	863
302	307	\N	\N	303	coadjutors thuggeries nondestructive maladjustments	\N	\N	2	304
302	307	\N	\N	303	coadjutors thuggeries nondestructive maladjustments	\N	\N	2	306
309	2514	\N	\N	308	neurosurgeon innervated hunts barrens emanative blowpipe varies thickest machinability	\N	\N	2	1257
309	2514	\N	\N	308	neurosurgeon innervated hunts barrens emanative blowpipe varies thickest machinability	\N	\N	2	1965
310	894	\N	\N	308	bedstraws thoughtless elation swampland earings circumscribed paralyzingly	\N	\N	2	42
310	894	\N	\N	308	bedstraws thoughtless elation swampland earings circumscribed paralyzingly	\N	\N	2	895
313	2904	\N	\N	2500	overweight readmits loopholing tattles	\N	\N	2	311
313	2904	\N	\N	2500	overweight readmits loopholing tattles	\N	\N	2	328
350	351	\N	\N	353	overabundant legworks easeful cognize hoatzin toiled nonspecialized vrouw	\N	\N	2	237
350	351	\N	\N	353	overabundant legworks easeful cognize hoatzin toiled nonspecialized vrouw	\N	\N	2	330
354	356	\N	\N	358	claymores shiftlessly feedstuffs lyricizing hierarchs composedly taunting dragged	\N	\N	2	343
354	356	\N	\N	358	claymores shiftlessly feedstuffs lyricizing hierarchs composedly taunting dragged	\N	\N	2	355
360	1832	\N	\N	1821	refocus vividness administrated remedying prophetically allayed zinged fridge	\N	\N	2	336
360	1832	\N	\N	1821	refocus vividness administrated remedying prophetically allayed zinged fridge	\N	\N	2	1629
362	363	\N	\N	130	safest signiory latchets inflecting trephines hops exec	\N	\N	2	128
362	363	\N	\N	130	safest signiory latchets inflecting trephines hops exec	\N	\N	2	129
368	2010	\N	\N	2009	overweight readmits loopholing tattles irradiates	\N	\N	2	366
368	2010	\N	\N	2009	overweight readmits loopholing tattles irradiates	\N	\N	2	2008
373	1358	\N	\N	1357	amenities desecrated tetrachlorides loutish polygony	\N	\N	2	1329
373	1358	\N	\N	1357	amenities desecrated tetrachlorides loutish polygony	\N	\N	2	1356
374	2288	\N	\N	348	plights corollaries gaudiness irades inadvisability	\N	\N	2	372
374	2288	\N	\N	348	plights corollaries gaudiness irades inadvisability	\N	\N	2	1711
376	2922	\N	\N	348	dissociated heartier petitionee brill	\N	\N	2	372
376	2922	\N	\N	348	dissociated heartier petitionee brill	\N	\N	2	1711
383	386	\N	\N	384	inserter plights corollaries gaudiness irades	\N	\N	2	333
383	386	\N	\N	384	inserter plights corollaries gaudiness irades	\N	\N	2	387
392	2758	\N	\N	1302	kinkiest xix recollected householder overeducated objurgate treaties	\N	\N	2	388
392	2758	\N	\N	1302	kinkiest xix recollected householder overeducated objurgate treaties	\N	\N	2	1300
393	2671	\N	\N	1730	playgoers cheques batting waspishly stilbestrol	\N	\N	2	388
393	2671	\N	\N	1730	playgoers cheques batting waspishly stilbestrol	\N	\N	2	2229
394	1299	\N	\N	1302	pirog desexes summable heliocentricity excretions	\N	\N	2	388
394	1299	\N	\N	1302	pirog desexes summable heliocentricity excretions	\N	\N	2	1300
398	1694	\N	\N	1217	decaffeinates scalepan folklorists attractive yeller cognizably reminds	\N	\N	2	876
398	1694	\N	\N	1217	decaffeinates scalepan folklorists attractive yeller cognizably reminds	\N	\N	2	1355
399	2316	\N	\N	2315	pasturage thurifer teazle fringier rhythmical wastebaskets powderer immigrates inserter	\N	\N	2	396
399	2316	\N	\N	2315	pasturage thurifer teazle fringier rhythmical wastebaskets powderer immigrates inserter	\N	\N	2	1553
400	2614	\N	\N	1217	swifters redigesting ostinato recalculation safest signiory	\N	\N	2	876
400	2614	\N	\N	1217	swifters redigesting ostinato recalculation safest signiory	\N	\N	2	1355
404	406	\N	\N	28	overeducated objurgate treaties preprocessor despising loftily yabber reprovingly	\N	\N	2	337
404	406	\N	\N	28	overeducated objurgate treaties preprocessor despising loftily yabber reprovingly	\N	\N	2	380
408	1844	\N	\N	407	blubberer amenities desecrated tetrachlorides loutish	\N	\N	2	345
408	1844	\N	\N	407	blubberer amenities desecrated tetrachlorides loutish	\N	\N	2	676
411	1314	\N	\N	802	preprocessor despising loftily yabber reprovingly	\N	\N	2	409
411	1314	\N	\N	802	preprocessor despising loftily yabber reprovingly	\N	\N	2	1315
413	2802	\N	\N	53	venturers valiantly unremorsefully extradites	\N	\N	2	412
413	2802	\N	\N	53	venturers valiantly unremorsefully extradites	\N	\N	2	1245
414	1368	\N	\N	1369	splinting surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking	\N	\N	2	1098
414	1368	\N	\N	1369	splinting surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking	\N	\N	2	1370
417	2774	\N	\N	1369	petitionee brill neologic intermuscular fobbed	\N	\N	2	1098
417	2774	\N	\N	1369	petitionee brill neologic intermuscular fobbed	\N	\N	2	1370
418	2039	\N	\N	53	nigglings midmonths labium peeped daydreams	\N	\N	2	412
418	2039	\N	\N	53	nigglings midmonths labium peeped daydreams	\N	\N	2	1245
419	2546	\N	\N	587	skimpiest outpoured dissociated heartier petitionee brill neologic intermuscular fobbed	\N	\N	2	584
419	2546	\N	\N	587	skimpiest outpoured dissociated heartier petitionee brill neologic intermuscular fobbed	\N	\N	2	585
420	586	\N	\N	587	riffled kerneling napoleons rifer splinting surmisers satisfying	\N	\N	2	584
420	586	\N	\N	587	riffled kerneling napoleons rifer splinting surmisers satisfying	\N	\N	2	585
421	2472	\N	\N	36	outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens	\N	\N	2	35
421	2472	\N	\N	36	outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens	\N	\N	2	39
422	2551	\N	\N	36	yabber reprovingly blungers dwarflike	\N	\N	2	35
422	2551	\N	\N	36	yabber reprovingly blungers dwarflike	\N	\N	2	2202
430	431	\N	\N	433	wastebaskets powderer immigrates inserter plights	\N	\N	2	157
430	431	\N	\N	433	wastebaskets powderer immigrates inserter plights	\N	\N	2	434
437	3058	\N	\N	1591	arcadian acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst	\N	\N	2	51
437	3058	\N	\N	1591	arcadian acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst	\N	\N	2	435
444	1967	\N	\N	1369	substituting surges preheats loggias	\N	\N	2	1098
444	1967	\N	\N	1369	substituting surges preheats loggias	\N	\N	2	1968
446	2284	\N	\N	405	nonfiction retrogressions eliminates unknowns mongoloids	\N	\N	2	1011
446	2284	\N	\N	405	nonfiction retrogressions eliminates unknowns mongoloids	\N	\N	2	1225
455	456	\N	\N	457	slavishly hipless prs bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	458
455	456	\N	\N	457	slavishly hipless prs bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	459
473	2307	\N	\N	2189	transcribed swifters redigesting ostinato recalculation safest signiory latchets inflecting	\N	\N	2	471
473	2307	\N	\N	2189	transcribed swifters redigesting ostinato recalculation safest signiory latchets inflecting	\N	\N	2	1350
479	2766	\N	\N	1458	polygony malines cliffhanger entailments reindexed bedstraws	\N	\N	2	403
479	2766	\N	\N	1458	polygony malines cliffhanger entailments reindexed bedstraws	\N	\N	2	477
483	2391	\N	\N	66	resonates overbites terminals giros	\N	\N	2	63
483	2391	\N	\N	66	resonates overbites terminals giros	\N	\N	2	64
485	2042	\N	\N	66	bewitchment cheaters riffled kerneling napoleons rifer splinting	\N	\N	2	1174
485	2042	\N	\N	66	bewitchment cheaters riffled kerneling napoleons rifer splinting	\N	\N	2	2043
486	1022	\N	\N	1020	undermentioned outflanking funnyman commuted lachrymation	\N	\N	2	66
486	1022	\N	\N	1020	undermentioned outflanking funnyman commuted lachrymation	\N	\N	2	316
489	2686	\N	\N	488	trephines hops exec junketeers isolators reducing	\N	\N	2	1348
489	2686	\N	\N	488	trephines hops exec junketeers isolators reducing	\N	\N	2	2065
490	3080	\N	\N	488	blowpipe varies thickest machinability orbiters tormentor owner	\N	\N	2	96
490	3080	\N	\N	488	blowpipe varies thickest machinability orbiters tormentor owner	\N	\N	2	1055
491	2897	\N	\N	488	circumscribed paralyzingly pouchy surrejoinders chestiest measurage	\N	\N	2	606
491	2897	\N	\N	488	circumscribed paralyzingly pouchy surrejoinders chestiest measurage	\N	\N	2	1055
492	1909	\N	\N	488	nigglings midmonths labium peeped daydreams permuting	\N	\N	2	96
492	1909	\N	\N	488	nigglings midmonths labium peeped daydreams permuting	\N	\N	2	1055
499	2106	\N	\N	1204	safest signiory latchets inflecting trephines hops	\N	\N	2	139
499	2106	\N	\N	1204	safest signiory latchets inflecting trephines hops	\N	\N	2	497
500	2995	\N	\N	2152	mohairs admiralties bewigged playgoers cheques	\N	\N	2	442
500	2995	\N	\N	2152	mohairs admiralties bewigged playgoers cheques	\N	\N	2	2082
502	3066	\N	\N	1204	commuted lachrymation floweret arcadian acridities	\N	\N	2	139
502	3066	\N	\N	1204	commuted lachrymation floweret arcadian acridities	\N	\N	2	497
503	2151	\N	\N	2152	blungers dwarflike effulgences coreless tuberculoses environs hulled	\N	\N	2	442
503	2151	\N	\N	2152	blungers dwarflike effulgences coreless tuberculoses environs hulled	\N	\N	2	2082
506	3023	\N	\N	504	terminals giros podgy vagus kinkiest	\N	\N	2	1507
507	2584	\N	\N	504	phenylketonuria grunts venturers valiantly unremorsefully	\N	\N	2	520
507	2584	\N	\N	504	phenylketonuria grunts venturers valiantly unremorsefully	\N	\N	2	1829
508	2412	\N	\N	504	floweret arcadian acridities unrealistic substituting surges	\N	\N	2	21
508	2412	\N	\N	504	floweret arcadian acridities unrealistic substituting surges	\N	\N	2	1730
509	2047	\N	\N	504	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity excretions	\N	\N	2	1101
509	2047	\N	\N	504	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity excretions	\N	\N	2	1507
512	3060	\N	\N	433	administrated remedying prophetically allayed zinged fridge	\N	\N	2	157
512	3060	\N	\N	433	administrated remedying prophetically allayed zinged fridge	\N	\N	2	434
521	2852	\N	\N	21	napoleons rifer splinting surmisers satisfying undamped sharpers forbearer	\N	\N	2	520
521	2852	\N	\N	21	napoleons rifer splinting surmisers satisfying undamped sharpers forbearer	\N	\N	2	1301
526	2481	\N	\N	524	demarcators tasselling crocked wharfinger reconverting washboards overdrank recalculations	\N	\N	2	1390
526	2481	\N	\N	524	demarcators tasselling crocked wharfinger reconverting washboards overdrank recalculations	\N	\N	2	1425
527	2920	\N	\N	1123	mendelism kookiest leavening embrocation casteless	\N	\N	2	321
527	2920	\N	\N	1123	mendelism kookiest leavening embrocation casteless	\N	\N	2	524
533	2296	\N	\N	179	villainousness miscalling firefanged skeins equalled sandwiching bewitchment cheaters riffled	\N	\N	2	176
533	2296	\N	\N	179	villainousness miscalling firefanged skeins equalled sandwiching bewitchment cheaters riffled	\N	\N	2	177
536	2591	\N	\N	535	dissociative apostacy malting footgear abominators trilobate jigsawed kickstands prated	\N	\N	2	1009
536	2591	\N	\N	535	dissociative apostacy malting footgear abominators trilobate jigsawed kickstands prated	\N	\N	2	1045
539	550	\N	\N	549	addends surveiled wagers joysticks nonliving agric	\N	\N	2	537
539	550	\N	\N	549	addends surveiled wagers joysticks nonliving agric	\N	\N	2	552
547	2518	\N	\N	146	yabber reprovingly blungers dwarflike effulgences coreless	\N	\N	2	143
547	2518	\N	\N	146	yabber reprovingly blungers dwarflike effulgences coreless	\N	\N	2	545
556	559	\N	\N	558	thanklessly swiveled polers oinked	\N	\N	2	557
556	559	\N	\N	558	thanklessly swiveled polers oinked	\N	\N	2	560
568	1563	\N	\N	1562	uroliths sashes marrieds fungic gasogenes obnoxiously	\N	\N	2	1143
568	1563	\N	\N	1562	uroliths sashes marrieds fungic gasogenes obnoxiously	\N	\N	2	1561
570	573	\N	\N	195	waspishly stilbestrol villainousness miscalling firefanged skeins	\N	\N	2	199
570	573	\N	\N	195	waspishly stilbestrol villainousness miscalling firefanged skeins	\N	\N	2	571
591	2613	\N	\N	1596	obnoxiously dismounting endorser libations harrower claymores shiftlessly	\N	\N	2	325
591	2613	\N	\N	1596	obnoxiously dismounting endorser libations harrower claymores shiftlessly	\N	\N	2	2612
594	2963	\N	\N	316	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	\N	\N	2	64
594	2963	\N	\N	316	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	\N	\N	2	2063
595	1492	\N	\N	48	lenity tautological jambing sodality	\N	\N	2	47
595	1492	\N	\N	48	lenity tautological jambing sodality	\N	\N	2	592
602	603	\N	\N	345	junketeers isolators reducing nethermost nonfiction retrogressions eliminates	\N	\N	2	604
602	603	\N	\N	345	junketeers isolators reducing nethermost nonfiction retrogressions eliminates	\N	\N	2	605
607	1718	\N	\N	1720	signiory latchets inflecting trephines hops	\N	\N	2	1570
607	1718	\N	\N	1720	signiory latchets inflecting trephines hops	\N	\N	2	1719
608	2532	\N	\N	2533	innervated hunts barrens emanative blowpipe varies	\N	\N	2	99
608	2532	\N	\N	2533	innervated hunts barrens emanative blowpipe varies	\N	\N	2	1472
609	2590	\N	\N	2533	danker raunchiness perspicuously disjoined nigglings	\N	\N	2	99
609	2590	\N	\N	2533	danker raunchiness perspicuously disjoined nigglings	\N	\N	2	1472
611	2143	\N	\N	1839	reindexed bedstraws thoughtless elation swampland	\N	\N	2	99
611	2143	\N	\N	1839	reindexed bedstraws thoughtless elation swampland	\N	\N	2	2142
617	1652	\N	\N	558	waspishly stilbestrol villainousness miscalling firefanged	\N	\N	2	301
617	1652	\N	\N	558	waspishly stilbestrol villainousness miscalling firefanged	\N	\N	2	615
618	687	\N	\N	686	heliocentricity excretions recelebrating dually plateauing reoccupations embossers	\N	\N	2	688
618	687	\N	\N	686	heliocentricity excretions recelebrating dually plateauing reoccupations embossers	\N	\N	2	689
619	621	\N	\N	622	irades inadvisability disciplinarians majors manifestly decaffeinates scalepan	\N	\N	2	541
619	621	\N	\N	622	irades inadvisability disciplinarians majors manifestly decaffeinates scalepan	\N	\N	2	623
625	630	\N	\N	628	stollens ponderers conditione loathly	\N	\N	2	626
625	630	\N	\N	628	stollens ponderers conditione loathly	\N	\N	2	629
635	2736	\N	\N	917	petitionee brill neologic intermuscular	\N	\N	2	633
635	2736	\N	\N	917	petitionee brill neologic intermuscular	\N	\N	2	2679
637	2715	\N	\N	917	cheques batting waspishly stilbestrol villainousness miscalling firefanged	\N	\N	2	633
637	2715	\N	\N	917	cheques batting waspishly stilbestrol villainousness miscalling firefanged	\N	\N	2	1475
639	1474	\N	\N	917	tuberculoses environs hulled preexamination oralogy tibetans slavishly hipless prs	\N	\N	2	633
639	1474	\N	\N	917	tuberculoses environs hulled preexamination oralogy tibetans slavishly hipless prs	\N	\N	2	1475
640	643	\N	\N	641	claymores shiftlessly feedstuffs lyricizing hierarchs composedly taunting	\N	\N	2	642
640	643	\N	\N	641	claymores shiftlessly feedstuffs lyricizing hierarchs composedly taunting	\N	\N	2	645
650	2015	\N	\N	272	amenities desecrated tetrachlorides loutish polygony malines cliffhanger entailments	\N	\N	2	647
650	2015	\N	\N	272	amenities desecrated tetrachlorides loutish polygony malines cliffhanger entailments	\N	\N	2	723
651	2712	\N	\N	272	labium peeped daydreams permuting immediately canzona interrelated cooked reformers	\N	\N	2	647
651	2712	\N	\N	272	labium peeped daydreams permuting immediately canzona interrelated cooked reformers	\N	\N	2	1773
654	1457	\N	\N	1458	tonsils pasturage thurifer teazle fringier rhythmical wastebaskets	\N	\N	2	652
654	1457	\N	\N	1458	tonsils pasturage thurifer teazle fringier rhythmical wastebaskets	\N	\N	2	1059
655	2842	\N	\N	403	corkscrewed promiscuousness clewed reassemble hesitation fainting croupy bacchanalia regainers	\N	\N	2	652
655	2842	\N	\N	403	corkscrewed promiscuousness clewed reassemble hesitation fainting croupy bacchanalia regainers	\N	\N	2	729
656	1063	\N	\N	403	interrelated cooked reformers goodwife technicolor plenishes nippy bounden	\N	\N	2	652
656	1063	\N	\N	403	interrelated cooked reformers goodwife technicolor plenishes nippy bounden	\N	\N	2	729
659	662	\N	\N	663	decentralizing hogfishes gantleted richer succories	\N	\N	2	660
659	662	\N	\N	663	decentralizing hogfishes gantleted richer succories	\N	\N	2	664
667	2194	\N	\N	327	plights corollaries gaudiness irades inadvisability disciplinarians	\N	\N	2	514
667	2194	\N	\N	327	plights corollaries gaudiness irades inadvisability disciplinarians	\N	\N	2	1672
669	1972	\N	\N	327	zinged fridge stained unintentional antiquarians dilutes quantitatively	\N	\N	2	514
669	1972	\N	\N	327	zinged fridge stained unintentional antiquarians dilutes quantitatively	\N	\N	2	1672
671	1856	\N	\N	327	blowpipe varies thickest machinability orbiters tormentor owner zanier	\N	\N	2	514
671	1856	\N	\N	327	blowpipe varies thickest machinability orbiters tormentor owner zanier	\N	\N	2	1855
678	2025	\N	\N	676	orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble	\N	\N	2	1003
678	2025	\N	\N	676	orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble	\N	\N	2	2026
679	2797	\N	\N	676	daydreams permuting immediately canzona interrelated cooked reformers	\N	\N	2	1003
679	2797	\N	\N	676	daydreams permuting immediately canzona interrelated cooked reformers	\N	\N	2	2026
684	2069	\N	\N	2070	peeped daydreams permuting immediately canzona interrelated cooked reformers goodwife	\N	\N	2	516
684	2069	\N	\N	2070	peeped daydreams permuting immediately canzona interrelated cooked reformers goodwife	\N	\N	2	682
696	1749	\N	\N	1750	reaccepts gunneries exorcises pirog desexes	\N	\N	2	694
696	1749	\N	\N	1750	reaccepts gunneries exorcises pirog desexes	\N	\N	2	1310
699	1841	\N	\N	1214	crocked wharfinger reconverting washboards overdrank	\N	\N	2	666
699	1841	\N	\N	1214	crocked wharfinger reconverting washboards overdrank	\N	\N	2	697
700	703	\N	\N	146	wastebaskets powderer immigrates inserter	\N	\N	2	701
700	703	\N	\N	146	wastebaskets powderer immigrates inserter	\N	\N	2	702
707	2594	\N	\N	706	maladjustments subpartnership cordilleras recirculations alkalin succulently marquise underlaid neurosurgeon	\N	\N	2	1015
707	2594	\N	\N	706	maladjustments subpartnership cordilleras recirculations alkalin succulently marquise underlaid neurosurgeon	\N	\N	2	2312
708	709	\N	\N	712	daydreams permuting immediately canzona	\N	\N	2	710
708	709	\N	\N	712	daydreams permuting immediately canzona	\N	\N	2	711
717	718	\N	\N	346	waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching	\N	\N	2	719
717	718	\N	\N	346	waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching	\N	\N	2	720
730	732	\N	\N	733	inconvenience triunities dipped votarists kilogram	\N	\N	2	731
730	732	\N	\N	733	inconvenience triunities dipped votarists kilogram	\N	\N	2	735
739	2489	\N	\N	2490	cartons acquirable refocus vividness administrated	\N	\N	2	482
739	2489	\N	\N	2490	cartons acquirable refocus vividness administrated	\N	\N	2	2491
740	2628	\N	\N	2490	thurifer teazle fringier rhythmical	\N	\N	2	482
740	2628	\N	\N	2490	thurifer teazle fringier rhythmical	\N	\N	2	2491
745	748	\N	\N	290	neologic intermuscular fobbed transcribed swifters redigesting ostinato recalculation	\N	\N	2	291
745	748	\N	\N	290	neologic intermuscular fobbed transcribed swifters redigesting ostinato recalculation	\N	\N	2	746
750	1426	\N	\N	749	unknowns mongoloids danker raunchiness perspicuously disjoined	\N	\N	2	1196
750	1426	\N	\N	749	unknowns mongoloids danker raunchiness perspicuously disjoined	\N	\N	2	1427
754	758	\N	\N	755	chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical	\N	\N	2	757
754	758	\N	\N	755	chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical	\N	\N	2	759
763	1802	\N	\N	182	outpoured dissociated heartier petitionee brill neologic intermuscular fobbed transcribed	\N	\N	2	761
763	1802	\N	\N	182	outpoured dissociated heartier petitionee brill neologic intermuscular fobbed transcribed	\N	\N	2	1620
764	765	\N	\N	767	disinclines antonyms anesthetize chanticleer administrants preengaging	\N	\N	2	315
764	765	\N	\N	767	disinclines antonyms anesthetize chanticleer administrants preengaging	\N	\N	2	768
771	1349	\N	\N	770	succulently marquise underlaid neurosurgeon innervated	\N	\N	2	1351
771	1349	\N	\N	770	succulently marquise underlaid neurosurgeon innervated	\N	\N	2	1352
772	2409	\N	\N	2189	canzona interrelated cooked reformers goodwife technicolor plenishes nippy bounden	\N	\N	2	1397
772	2409	\N	\N	2189	canzona interrelated cooked reformers goodwife technicolor plenishes nippy bounden	\N	\N	2	1839
773	1499	\N	\N	770	retrogressions eliminates unknowns mongoloids	\N	\N	2	1351
773	1499	\N	\N	770	retrogressions eliminates unknowns mongoloids	\N	\N	2	1352
774	776	\N	\N	775	loggias reconciliating photocatalyst lenity tautological	\N	\N	2	27
774	776	\N	\N	775	loggias reconciliating photocatalyst lenity tautological	\N	\N	2	778
786	2857	\N	\N	785	cordilleras recirculations alkalin succulently marquise underlaid neurosurgeon	\N	\N	2	429
786	2857	\N	\N	785	cordilleras recirculations alkalin succulently marquise underlaid neurosurgeon	\N	\N	2	1416
788	2989	\N	\N	787	evasiveness toto teashop reaccepts	\N	\N	2	1550
788	2989	\N	\N	787	evasiveness toto teashop reaccepts	\N	\N	2	1737
789	2283	\N	\N	787	gantleted richer succories dwelling scrapped prat	\N	\N	2	1737
789	2283	\N	\N	787	gantleted richer succories dwelling scrapped prat	\N	\N	2	2282
793	1229	\N	\N	1228	rebroadcasting grousing overdrinking frow demarcators tasselling crocked	\N	\N	2	791
793	1229	\N	\N	1228	rebroadcasting grousing overdrinking frow demarcators tasselling crocked	\N	\N	2	1226
795	3037	\N	\N	1468	hesitation fainting croupy bacchanalia regainers teardown margarins inconvenience	\N	\N	2	339
795	3037	\N	\N	1468	hesitation fainting croupy bacchanalia regainers teardown margarins inconvenience	\N	\N	2	2374
798	799	\N	\N	800	refocus vividness administrated remedying prophetically allayed zinged fridge stained	\N	\N	2	121
798	799	\N	\N	800	refocus vividness administrated remedying prophetically allayed zinged fridge stained	\N	\N	2	552
803	2892	\N	\N	802	redigesting ostinato recalculation safest signiory latchets inflecting trephines hops	\N	\N	2	146
803	2892	\N	\N	802	redigesting ostinato recalculation safest signiory latchets inflecting trephines hops	\N	\N	2	1891
806	807	\N	\N	810	cliffhanger entailments reindexed bedstraws thoughtless	\N	\N	2	808
806	807	\N	\N	810	cliffhanger entailments reindexed bedstraws thoughtless	\N	\N	2	809
815	818	\N	\N	816	unknowns mongoloids danker raunchiness perspicuously	\N	\N	2	817
815	818	\N	\N	816	unknowns mongoloids danker raunchiness perspicuously	\N	\N	2	819
820	823	\N	\N	23	latchets inflecting trephines hops exec	\N	\N	2	464
820	823	\N	\N	23	latchets inflecting trephines hops exec	\N	\N	2	821
827	829	\N	\N	146	danker raunchiness perspicuously disjoined nigglings midmonths	\N	\N	2	701
827	829	\N	\N	146	danker raunchiness perspicuously disjoined nigglings midmonths	\N	\N	2	828
834	837	\N	\N	838	orbiters tormentor owner zanier corkscrewed promiscuousness	\N	\N	2	835
834	837	\N	\N	838	orbiters tormentor owner zanier corkscrewed promiscuousness	\N	\N	2	839
847	2751	\N	\N	349	nethermost nonfiction retrogressions eliminates unknowns	\N	\N	2	275
847	2751	\N	\N	349	nethermost nonfiction retrogressions eliminates unknowns	\N	\N	2	458
848	2292	\N	\N	349	immediately canzona interrelated cooked reformers	\N	\N	2	462
848	2292	\N	\N	349	immediately canzona interrelated cooked reformers	\N	\N	2	844
849	2860	\N	\N	349	overeducated objurgate treaties preprocessor	\N	\N	2	844
849	2860	\N	\N	349	overeducated objurgate treaties preprocessor	\N	\N	2	2753
850	1157	\N	\N	226	vitric mendelism kookiest leavening embrocation casteless uroliths sashes marrieds	\N	\N	2	1156
850	1157	\N	\N	226	vitric mendelism kookiest leavening embrocation casteless uroliths sashes marrieds	\N	\N	2	1159
851	1554	\N	\N	226	decaffeinates scalepan folklorists attractive yeller cognizably reminds teratoid	\N	\N	2	1156
851	1554	\N	\N	226	decaffeinates scalepan folklorists attractive yeller cognizably reminds teratoid	\N	\N	2	1159
853	2271	\N	\N	317	loathly cancels debiting parrots paraguayans	\N	\N	2	693
853	2271	\N	\N	317	loathly cancels debiting parrots paraguayans	\N	\N	2	1269
854	1540	\N	\N	1542	preexamination oralogy tibetans slavishly hipless	\N	\N	2	317
854	1540	\N	\N	1542	preexamination oralogy tibetans slavishly hipless	\N	\N	2	810
855	857	\N	\N	195	recollected householder overeducated objurgate treaties preprocessor despising loftily	\N	\N	2	199
855	857	\N	\N	195	recollected householder overeducated objurgate treaties preprocessor despising loftily	\N	\N	2	279
868	1820	\N	\N	270	trephines hops exec junketeers	\N	\N	2	544
868	1820	\N	\N	270	trephines hops exec junketeers	\N	\N	2	1819
870	3027	\N	\N	270	effulgences coreless tuberculoses environs hulled preexamination	\N	\N	2	544
870	3027	\N	\N	270	effulgences coreless tuberculoses environs hulled preexamination	\N	\N	2	1429
871	2991	\N	\N	270	circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils	\N	\N	2	544
871	2991	\N	\N	270	circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils	\N	\N	2	1429
878	2841	\N	\N	179	sharpers forbearer anesthetization undermentioned outflanking funnyman	\N	\N	2	176
878	2841	\N	\N	179	sharpers forbearer anesthetization undermentioned outflanking funnyman	\N	\N	2	2420
879	880	\N	\N	882	northers mutualist harebrained earthworms lunk forefended overtaking	\N	\N	2	881
879	880	\N	\N	882	northers mutualist harebrained earthworms lunk forefended overtaking	\N	\N	2	883
888	2570	\N	\N	887	reformers goodwife technicolor plenishes nippy bounden occulters	\N	\N	2	919
888	2570	\N	\N	887	reformers goodwife technicolor plenishes nippy bounden occulters	\N	\N	2	1315
904	2480	\N	\N	902	bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	131
904	2480	\N	\N	902	bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	1632
905	1887	\N	\N	1217	retrogressions eliminates unknowns mongoloids danker raunchiness	\N	\N	2	470
905	1887	\N	\N	1217	retrogressions eliminates unknowns mongoloids danker raunchiness	\N	\N	2	902
906	910	\N	\N	907	hesitation fainting croupy bacchanalia	\N	\N	2	908
906	910	\N	\N	907	hesitation fainting croupy bacchanalia	\N	\N	2	909
914	916	\N	\N	917	unremorsefully extradites stollens ponderers	\N	\N	2	346
914	916	\N	\N	917	unremorsefully extradites stollens ponderers	\N	\N	2	782
924	2028	\N	\N	1790	environs hulled preexamination oralogy tibetans	\N	\N	2	279
924	2028	\N	\N	1790	environs hulled preexamination oralogy tibetans	\N	\N	2	1112
925	926	\N	\N	23	skimpiest outpoured dissociated heartier petitionee brill neologic	\N	\N	2	135
925	926	\N	\N	23	skimpiest outpoured dissociated heartier petitionee brill neologic	\N	\N	2	927
931	1399	\N	\N	1397	scalepan folklorists attractive yeller cognizably reminds teratoid coadjutors thuggeries	\N	\N	2	929
931	1399	\N	\N	1397	scalepan folklorists attractive yeller cognizably reminds teratoid coadjutors thuggeries	\N	\N	2	1398
933	934	\N	\N	323	thoughtless elation swampland earings circumscribed paralyzingly pouchy	\N	\N	2	936
933	934	\N	\N	323	thoughtless elation swampland earings circumscribed paralyzingly pouchy	\N	\N	2	937
938	1995	\N	\N	1996	varies thickest machinability orbiters tormentor	\N	\N	2	891
938	1995	\N	\N	1996	varies thickest machinability orbiters tormentor	\N	\N	2	1412
939	940	\N	\N	943	placarders septuagenarians safecracker cacaos mignonette	\N	\N	2	942
939	940	\N	\N	943	placarders septuagenarians safecracker cacaos mignonette	\N	\N	2	944
949	2746	\N	\N	810	retrogressions eliminates unknowns mongoloids	\N	\N	2	693
949	2746	\N	\N	810	retrogressions eliminates unknowns mongoloids	\N	\N	2	947
954	955	\N	\N	956	reupholstered xerosis steamers neurological warranter	\N	\N	2	320
954	955	\N	\N	956	reupholstered xerosis steamers neurological warranter	\N	\N	2	957
960	1404	\N	\N	1359	pegboxes feeblish extenuation stranders abbesses strongboxes chromas	\N	\N	2	958
960	1404	\N	\N	1359	pegboxes feeblish extenuation stranders abbesses strongboxes chromas	\N	\N	2	1060
962	963	\N	\N	810	treaties preprocessor despising loftily	\N	\N	2	808
962	963	\N	\N	810	treaties preprocessor despising loftily	\N	\N	2	809
965	2836	\N	\N	2198	irradiates befriends insinuators restorers rebroadcasting grousing	\N	\N	2	261
965	2836	\N	\N	2198	irradiates befriends insinuators restorers rebroadcasting grousing	\N	\N	2	1126
969	2663	\N	\N	340	voucherable intercepting jeered immunopathology addends	\N	\N	2	967
969	2663	\N	\N	340	voucherable intercepting jeered immunopathology addends	\N	\N	2	2662
973	2114	\N	\N	329	parrots paraguayans resonates overbites terminals giros podgy	\N	\N	2	139
973	2114	\N	\N	329	parrots paraguayans resonates overbites terminals giros podgy	\N	\N	2	1058
974	2829	\N	\N	329	reoccupations embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques	\N	\N	2	972
974	2829	\N	\N	329	reoccupations embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques	\N	\N	2	1025
978	1344	\N	\N	329	equalled sandwiching bewitchment cheaters riffled kerneling napoleons rifer	\N	\N	2	972
978	1344	\N	\N	329	equalled sandwiching bewitchment cheaters riffled kerneling napoleons rifer	\N	\N	2	1343
979	1774	\N	\N	329	despising loftily yabber reprovingly blungers	\N	\N	2	972
979	1774	\N	\N	329	despising loftily yabber reprovingly blungers	\N	\N	2	1025
984	3031	\N	\N	983	underlaid neurosurgeon innervated hunts barrens emanative blowpipe	\N	\N	2	434
984	3031	\N	\N	983	underlaid neurosurgeon innervated hunts barrens emanative blowpipe	\N	\N	2	797
985	2911	\N	\N	2910	scalepan folklorists attractive yeller cognizably reminds teratoid	\N	\N	2	342
985	2911	\N	\N	2910	scalepan folklorists attractive yeller cognizably reminds teratoid	\N	\N	2	433
991	2024	\N	\N	323	xerosis steamers neurological warranter flashings oops detonations chippering	\N	\N	2	936
991	2024	\N	\N	323	xerosis steamers neurological warranter flashings oops detonations chippering	\N	\N	2	937
994	2964	\N	\N	755	inadvisability disciplinarians majors manifestly decaffeinates scalepan	\N	\N	2	1282
994	2964	\N	\N	755	inadvisability disciplinarians majors manifestly decaffeinates scalepan	\N	\N	2	1568
995	2536	\N	\N	755	tetrachlorides loutish polygony malines cliffhanger entailments	\N	\N	2	759
995	2536	\N	\N	755	tetrachlorides loutish polygony malines cliffhanger entailments	\N	\N	2	992
996	1567	\N	\N	755	neologic intermuscular fobbed transcribed swifters	\N	\N	2	1282
996	1567	\N	\N	755	neologic intermuscular fobbed transcribed swifters	\N	\N	2	1568
1005	2843	\N	\N	385	flashings oops detonations chippering photospherically pouchiest canvasses pyorrheas cartons	\N	\N	2	1658
1005	2843	\N	\N	385	flashings oops detonations chippering photospherically pouchiest canvasses pyorrheas cartons	\N	\N	2	2160
1006	2390	\N	\N	385	circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils pasturage	\N	\N	2	1658
1006	2390	\N	\N	385	circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils pasturage	\N	\N	2	2160
1014	2162	\N	\N	1013	toiled nonspecialized vrouw squads tantalums overweight readmits loopholing tattles	\N	\N	2	1214
1014	2162	\N	\N	1013	toiled nonspecialized vrouw squads tantalums overweight readmits loopholing tattles	\N	\N	2	2129
1017	2770	\N	\N	1015	owner zanier corkscrewed promiscuousness clewed reassemble hesitation fainting croupy	\N	\N	2	1047
1017	2770	\N	\N	1015	owner zanier corkscrewed promiscuousness clewed reassemble hesitation fainting croupy	\N	\N	2	1159
1019	2073	\N	\N	2072	overabundant legworks easeful cognize hoatzin toiled nonspecialized	\N	\N	2	495
1019	2073	\N	\N	2072	overabundant legworks easeful cognize hoatzin toiled nonspecialized	\N	\N	2	1052
1028	2700	\N	\N	1637	unmuzzling measles decentralizing hogfishes	\N	\N	2	1026
1028	2700	\N	\N	1637	unmuzzling measles decentralizing hogfishes	\N	\N	2	1520
1031	2866	\N	\N	2586	nonspecialized vrouw squads tantalums overweight readmits loopholing tattles	\N	\N	2	193
1031	2866	\N	\N	2586	nonspecialized vrouw squads tantalums overweight readmits loopholing tattles	\N	\N	2	1029
1033	2081	\N	\N	1129	coadjutors thuggeries nondestructive maladjustments subpartnership cordilleras recirculations alkalin succulently	\N	\N	2	691
1033	2081	\N	\N	1129	coadjutors thuggeries nondestructive maladjustments subpartnership cordilleras recirculations alkalin succulently	\N	\N	2	813
1034	2719	\N	\N	2017	heartier petitionee brill neologic intermuscular fobbed transcribed	\N	\N	2	1171
1034	2719	\N	\N	2017	heartier petitionee brill neologic intermuscular fobbed transcribed	\N	\N	2	2060
1035	2606	\N	\N	2607	nippy bounden occulters blubberer amenities desecrated tetrachlorides loutish polygony	\N	\N	2	691
1035	2606	\N	\N	2607	nippy bounden occulters blubberer amenities desecrated tetrachlorides loutish polygony	\N	\N	2	1049
1038	2165	\N	\N	1129	trephines hops exec junketeers isolators reducing nethermost nonfiction	\N	\N	2	691
1038	2165	\N	\N	1129	trephines hops exec junketeers isolators reducing nethermost nonfiction	\N	\N	2	813
1042	1665	\N	\N	1664	overbites terminals giros podgy vagus kinkiest xix	\N	\N	2	1039
1042	1665	\N	\N	1664	overbites terminals giros podgy vagus kinkiest xix	\N	\N	2	1666
1043	2992	\N	\N	2973	perspicuously disjoined nigglings midmonths labium peeped daydreams	\N	\N	2	1039
1043	2992	\N	\N	2973	perspicuously disjoined nigglings midmonths labium peeped daydreams	\N	\N	2	2423
1066	1067	\N	\N	1070	thickest machinability orbiters tormentor owner zanier	\N	\N	2	1068
1066	1067	\N	\N	1070	thickest machinability orbiters tormentor owner zanier	\N	\N	2	1071
1081	2534	\N	\N	838	triunities dipped votarists kilogram timbrel presell	\N	\N	2	88
1081	2534	\N	\N	838	triunities dipped votarists kilogram timbrel presell	\N	\N	2	1078
1082	1876	\N	\N	838	tetrachlorides loutish polygony malines cliffhanger	\N	\N	2	88
1082	1876	\N	\N	838	tetrachlorides loutish polygony malines cliffhanger	\N	\N	2	1078
1093	2819	\N	\N	2595	antiquarians dilutes quantitatively shovels vitric mendelism kookiest leavening	\N	\N	2	875
1093	2819	\N	\N	2595	antiquarians dilutes quantitatively shovels vitric mendelism kookiest leavening	\N	\N	2	2408
1094	2915	\N	\N	2595	inadvisability disciplinarians majors manifestly decaffeinates scalepan folklorists	\N	\N	2	875
1094	2915	\N	\N	2595	inadvisability disciplinarians majors manifestly decaffeinates scalepan folklorists	\N	\N	2	2408
1103	1786	\N	\N	1787	swampland earings circumscribed paralyzingly pouchy surrejoinders	\N	\N	2	1160
1103	1786	\N	\N	1787	swampland earings circumscribed paralyzingly pouchy surrejoinders	\N	\N	2	1696
1115	1796	\N	\N	1114	webbier foxiness toddy playlets	\N	\N	2	886
1115	1796	\N	\N	1114	webbier foxiness toddy playlets	\N	\N	2	1339
1120	3064	\N	\N	111	occulters blubberer amenities desecrated tetrachlorides loutish polygony malines cliffhanger	\N	\N	2	135
1120	3064	\N	\N	111	occulters blubberer amenities desecrated tetrachlorides loutish polygony malines cliffhanger	\N	\N	2	1262
1121	2693	\N	\N	2692	valiantly unremorsefully extradites stollens ponderers conditione loathly cancels debiting	\N	\N	2	946
1121	2693	\N	\N	2692	valiantly unremorsefully extradites stollens ponderers conditione loathly cancels debiting	\N	\N	2	2061
1122	1881	\N	\N	111	podgy vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	135
1122	1881	\N	\N	111	podgy vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	1262
1130	2789	\N	\N	1727	raunchiness perspicuously disjoined nigglings midmonths labium peeped	\N	\N	2	141
1130	2789	\N	\N	1727	raunchiness perspicuously disjoined nigglings midmonths labium peeped	\N	\N	2	1129
1132	2690	\N	\N	1129	plights corollaries gaudiness irades inadvisability disciplinarians	\N	\N	2	826
1132	2690	\N	\N	1129	plights corollaries gaudiness irades inadvisability disciplinarians	\N	\N	2	2345
1138	2764	\N	\N	1980	dumps carousels acidly deponent venges shivas	\N	\N	2	427
1138	2764	\N	\N	1980	dumps carousels acidly deponent venges shivas	\N	\N	2	1136
1147	3028	\N	\N	330	rebroadcasting grousing overdrinking frow	\N	\N	2	951
1147	3028	\N	\N	330	rebroadcasting grousing overdrinking frow	\N	\N	2	1145
1148	1377	\N	\N	36	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	\N	\N	2	38
1148	1377	\N	\N	36	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	\N	\N	2	1106
1152	2683	\N	\N	36	bewitchment cheaters riffled kerneling napoleons rifer	\N	\N	2	38
1152	2683	\N	\N	36	bewitchment cheaters riffled kerneling napoleons rifer	\N	\N	2	1106
1153	2986	\N	\N	2721	recalculation safest signiory latchets inflecting trephines hops	\N	\N	2	38
1153	2986	\N	\N	2721	recalculation safest signiory latchets inflecting trephines hops	\N	\N	2	1173
1164	2519	\N	\N	1781	easeful cognize hoatzin toiled nonspecialized vrouw squads tantalums overweight	\N	\N	2	281
1164	2519	\N	\N	1781	easeful cognize hoatzin toiled nonspecialized vrouw squads tantalums overweight	\N	\N	2	1681
1165	1531	\N	\N	1528	quantitatively shovels vitric mendelism kookiest	\N	\N	2	281
1165	1531	\N	\N	1528	quantitatively shovels vitric mendelism kookiest	\N	\N	2	1530
1168	1769	\N	\N	1166	fainting croupy bacchanalia regainers teardown margarins inconvenience triunities dipped	\N	\N	2	1767
1168	1769	\N	\N	1166	fainting croupy bacchanalia regainers teardown margarins inconvenience triunities dipped	\N	\N	2	1768
1169	2620	\N	\N	2428	fringier rhythmical wastebaskets powderer	\N	\N	2	323
1169	2620	\N	\N	2428	fringier rhythmical wastebaskets powderer	\N	\N	2	1166
1177	2548	\N	\N	1021	dumpers bering evasiveness toto teashop reaccepts gunneries	\N	\N	2	450
1177	2548	\N	\N	1021	dumpers bering evasiveness toto teashop reaccepts gunneries	\N	\N	2	2123
1181	2299	\N	\N	2173	votarists kilogram timbrel presell woodcraft reupholstered	\N	\N	2	1618
1181	2299	\N	\N	2173	votarists kilogram timbrel presell woodcraft reupholstered	\N	\N	2	2300
1190	1195	\N	\N	1194	lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	\N	\N	2	1191
1190	1195	\N	\N	1194	lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	\N	\N	2	1192
1199	2163	\N	\N	1198	composedly taunting dragged lobsters careering triplets hepatics colonies defalcate	\N	\N	2	116
1199	2163	\N	\N	1198	composedly taunting dragged lobsters careering triplets hepatics colonies defalcate	\N	\N	2	2076
1202	1203	\N	\N	1204	cerebrum gloves mohairs admiralties	\N	\N	2	449
1202	1203	\N	\N	1204	cerebrum gloves mohairs admiralties	\N	\N	2	753
1216	1221	\N	\N	1217	slavishly hipless prs bluejays	\N	\N	2	1219
1216	1221	\N	\N	1217	slavishly hipless prs bluejays	\N	\N	2	1220
1231	2342	\N	\N	111	trephines hops exec junketeers isolators reducing	\N	\N	2	113
1231	2342	\N	\N	111	trephines hops exec junketeers isolators reducing	\N	\N	2	126
1232	3063	\N	\N	111	acridities unrealistic substituting surges	\N	\N	2	113
1232	3063	\N	\N	111	acridities unrealistic substituting surges	\N	\N	2	126
1238	2507	\N	\N	195	summable heliocentricity excretions recelebrating dually plateauing	\N	\N	2	199
1238	2507	\N	\N	195	summable heliocentricity excretions recelebrating dually plateauing	\N	\N	2	279
1241	1243	\N	\N	341	undermentioned outflanking funnyman commuted lachrymation floweret arcadian	\N	\N	2	1242
1241	1243	\N	\N	341	undermentioned outflanking funnyman commuted lachrymation floweret arcadian	\N	\N	2	1244
1248	2701	\N	\N	1624	hops exec junketeers isolators reducing nethermost nonfiction retrogressions eliminates	\N	\N	2	632
1248	2701	\N	\N	1624	hops exec junketeers isolators reducing nethermost nonfiction retrogressions eliminates	\N	\N	2	1370
1251	1367	\N	\N	1255	subpartnership cordilleras recirculations alkalin succulently marquise	\N	\N	2	1056
1251	1367	\N	\N	1255	subpartnership cordilleras recirculations alkalin succulently marquise	\N	\N	2	1249
1252	1253	\N	\N	1255	photospherically pouchiest canvasses pyorrheas	\N	\N	2	1056
1252	1253	\N	\N	1255	photospherically pouchiest canvasses pyorrheas	\N	\N	2	1254
1256	1258	\N	\N	896	hesitation fainting croupy bacchanalia	\N	\N	2	468
1256	1258	\N	\N	896	hesitation fainting croupy bacchanalia	\N	\N	2	893
1264	2581	\N	\N	346	hulled preexamination oralogy tibetans	\N	\N	2	719
1264	2581	\N	\N	346	hulled preexamination oralogy tibetans	\N	\N	2	720
1265	1268	\N	\N	1267	hipless prs bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	1025
1265	1268	\N	\N	1267	hipless prs bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	1266
1273	1277	\N	\N	1276	commuted lachrymation floweret arcadian acridities unrealistic substituting surges	\N	\N	2	725
1273	1277	\N	\N	1276	commuted lachrymation floweret arcadian acridities unrealistic substituting surges	\N	\N	2	1274
1289	1290	\N	\N	195	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted	\N	\N	2	196
1289	1290	\N	\N	195	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted	\N	\N	2	1209
1295	2716	\N	\N	385	regainers teardown margarins inconvenience	\N	\N	2	1293
1295	2716	\N	\N	385	regainers teardown margarins inconvenience	\N	\N	2	1420
1303	1306	\N	\N	403	succulently marquise underlaid neurosurgeon innervated hunts barrens emanative	\N	\N	2	1304
1303	1306	\N	\N	403	succulently marquise underlaid neurosurgeon innervated hunts barrens emanative	\N	\N	2	1305
1313	2574	\N	\N	896	wastebaskets powderer immigrates inserter plights corollaries gaudiness irades	\N	\N	2	468
1313	2574	\N	\N	896	wastebaskets powderer immigrates inserter plights corollaries gaudiness irades	\N	\N	2	898
1320	1324	\N	\N	1325	oblongish leapfrogged overabundant legworks easeful cognize hoatzin toiled	\N	\N	2	1321
1320	1324	\N	\N	1325	oblongish leapfrogged overabundant legworks easeful cognize hoatzin toiled	\N	\N	2	1322
1331	1333	\N	\N	1332	cooked reformers goodwife technicolor plenishes	\N	\N	2	817
1331	1333	\N	\N	1332	cooked reformers goodwife technicolor plenishes	\N	\N	2	1334
1337	2863	\N	\N	1541	immediately canzona interrelated cooked	\N	\N	2	1335
1337	2863	\N	\N	1541	immediately canzona interrelated cooked	\N	\N	2	1419
1346	2419	\N	\N	896	technicolor plenishes nippy bounden occulters blubberer amenities desecrated tetrachlorides	\N	\N	2	468
1346	2419	\N	\N	896	technicolor plenishes nippy bounden occulters blubberer amenities desecrated tetrachlorides	\N	\N	2	893
1362	2794	\N	\N	558	satisfying undamped sharpers forbearer	\N	\N	2	331
1362	2794	\N	\N	558	satisfying undamped sharpers forbearer	\N	\N	2	1360
1387	2529	\N	\N	2528	cheaters riffled kerneling napoleons rifer splinting surmisers satisfying undamped	\N	\N	2	1634
1387	2529	\N	\N	2528	cheaters riffled kerneling napoleons rifer splinting surmisers satisfying undamped	\N	\N	2	2082
1392	1393	\N	\N	179	overeducated objurgate treaties preprocessor despising loftily yabber reprovingly blungers	\N	\N	2	1050
1392	1393	\N	\N	179	overeducated objurgate treaties preprocessor despising loftily yabber reprovingly blungers	\N	\N	2	1191
1395	2982	\N	\N	1394	sodality outcrop slipcases phenylketonuria grunts venturers valiantly	\N	\N	2	725
1395	2982	\N	\N	1394	sodality outcrop slipcases phenylketonuria grunts venturers valiantly	\N	\N	2	2066
1396	2177	\N	\N	1394	loftily yabber reprovingly blungers dwarflike effulgences coreless tuberculoses environs	\N	\N	2	23
1396	2177	\N	\N	1394	loftily yabber reprovingly blungers dwarflike effulgences coreless tuberculoses environs	\N	\N	2	2178
1407	2999	\N	\N	2428	clewed reassemble hesitation fainting croupy bacchanalia regainers teardown	\N	\N	2	1287
1407	2999	\N	\N	2428	clewed reassemble hesitation fainting croupy bacchanalia regainers teardown	\N	\N	2	1405
1431	2996	\N	\N	1217	interrelated cooked reformers goodwife technicolor plenishes nippy bounden	\N	\N	2	876
1431	2996	\N	\N	1217	interrelated cooked reformers goodwife technicolor plenishes nippy bounden	\N	\N	2	2416
1434	1435	\N	\N	1438	colonies defalcate transplantations forfends	\N	\N	2	1053
1434	1435	\N	\N	1438	colonies defalcate transplantations forfends	\N	\N	2	1437
1443	3025	\N	\N	1793	pouchiest canvasses pyorrheas cartons acquirable refocus vividness	\N	\N	2	338
1443	3025	\N	\N	1793	pouchiest canvasses pyorrheas cartons acquirable refocus vividness	\N	\N	2	1781
1450	2367	\N	\N	1662	overtaking sourdoughs traditionless spoliator earthlier stenographers reallocating aslope	\N	\N	2	1364
1450	2367	\N	\N	1662	overtaking sourdoughs traditionless spoliator earthlier stenographers reallocating aslope	\N	\N	2	1448
1452	1978	\N	\N	319	substituting surges preheats loggias reconciliating	\N	\N	2	451
1452	1978	\N	\N	319	substituting surges preheats loggias reconciliating	\N	\N	2	946
1453	2993	\N	\N	319	exec junketeers isolators reducing nethermost nonfiction retrogressions	\N	\N	2	451
1453	2993	\N	\N	319	exec junketeers isolators reducing nethermost nonfiction retrogressions	\N	\N	2	946
1455	2913	\N	\N	111	effulgences coreless tuberculoses environs	\N	\N	2	319
1455	2913	\N	\N	111	effulgences coreless tuberculoses environs	\N	\N	2	2070
1464	1469	\N	\N	1468	innervated hunts barrens emanative blowpipe varies thickest	\N	\N	2	1466
1464	1469	\N	\N	1468	innervated hunts barrens emanative blowpipe varies thickest	\N	\N	2	1467
1477	2877	\N	\N	1476	trephines hops exec junketeers isolators reducing nethermost	\N	\N	2	1186
1477	2877	\N	\N	1476	trephines hops exec junketeers isolators reducing nethermost	\N	\N	2	1473
1478	2901	\N	\N	1476	effulgences coreless tuberculoses environs hulled preexamination oralogy tibetans	\N	\N	2	107
1478	2901	\N	\N	1476	effulgences coreless tuberculoses environs hulled preexamination oralogy tibetans	\N	\N	2	1620
1479	1984	\N	\N	1476	acridities unrealistic substituting surges preheats loggias	\N	\N	2	1186
1479	1984	\N	\N	1476	acridities unrealistic substituting surges preheats loggias	\N	\N	2	1473
1480	2882	\N	\N	1476	podgy vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	1473
1480	2882	\N	\N	1476	podgy vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	1862
1482	1766	\N	\N	1476	bewigged playgoers cheques batting waspishly stilbestrol	\N	\N	2	107
1482	1766	\N	\N	1476	bewigged playgoers cheques batting waspishly stilbestrol	\N	\N	2	1620
1483	2773	\N	\N	2528	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers	\N	\N	2	182
1483	2773	\N	\N	2528	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers	\N	\N	2	1476
1487	1708	\N	\N	1709	equalled sandwiching bewitchment cheaters riffled	\N	\N	2	371
1487	1708	\N	\N	1709	equalled sandwiching bewitchment cheaters riffled	\N	\N	2	1242
1488	2879	\N	\N	1709	prs bluejays cuppier nonsurgical skimpiest outpoured dissociated	\N	\N	2	371
1488	2879	\N	\N	1709	prs bluejays cuppier nonsurgical skimpiest outpoured dissociated	\N	\N	2	1242
1494	2126	\N	\N	2125	hunts barrens emanative blowpipe varies	\N	\N	2	303
1494	2126	\N	\N	2125	hunts barrens emanative blowpipe varies	\N	\N	2	347
1498	2245	\N	\N	331	polers oinked apnea maxillary dumpers	\N	\N	2	600
1498	2245	\N	\N	331	polers oinked apnea maxillary dumpers	\N	\N	2	688
1501	1504	\N	\N	1502	carpetbag peonism metropolitanize twanged pedros nonforfeitable dissociative apostacy	\N	\N	2	1235
1501	1504	\N	\N	1502	carpetbag peonism metropolitanize twanged pedros nonforfeitable dissociative apostacy	\N	\N	2	1503
1512	2708	\N	\N	457	thurifer teazle fringier rhythmical wastebaskets powderer immigrates inserter plights	\N	\N	2	458
1512	2708	\N	\N	457	thurifer teazle fringier rhythmical wastebaskets powderer immigrates inserter plights	\N	\N	2	459
1515	1516	\N	\N	1518	reminds teratoid coadjutors thuggeries nondestructive maladjustments subpartnership cordilleras	\N	\N	2	327
1515	1516	\N	\N	1518	reminds teratoid coadjutors thuggeries nondestructive maladjustments subpartnership cordilleras	\N	\N	2	1517
1527	3041	\N	\N	1526	junketeers isolators reducing nethermost nonfiction	\N	\N	2	335
1527	3041	\N	\N	1526	junketeers isolators reducing nethermost nonfiction	\N	\N	2	2302
1534	3079	\N	\N	1581	timbrel presell woodcraft reupholstered xerosis steamers neurological	\N	\N	2	1046
1534	3079	\N	\N	1581	timbrel presell woodcraft reupholstered xerosis steamers neurological	\N	\N	2	1753
1535	2779	\N	\N	1581	cliffhanger entailments reindexed bedstraws thoughtless elation	\N	\N	2	1046
1535	2779	\N	\N	1581	cliffhanger entailments reindexed bedstraws thoughtless elation	\N	\N	2	1753
1536	2103	\N	\N	1581	decaffeinates scalepan folklorists attractive	\N	\N	2	365
1536	2103	\N	\N	1581	decaffeinates scalepan folklorists attractive	\N	\N	2	1046
1545	2980	\N	\N	470	fringier rhythmical wastebaskets powderer	\N	\N	2	1317
1545	2980	\N	\N	470	fringier rhythmical wastebaskets powderer	\N	\N	2	1543
1548	3022	\N	\N	1255	chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical wastebaskets	\N	\N	2	1056
1548	3022	\N	\N	1255	chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical wastebaskets	\N	\N	2	1254
1566	2953	\N	\N	816	parrots paraguayans resonates overbites terminals giros	\N	\N	2	440
1566	2953	\N	\N	816	parrots paraguayans resonates overbites terminals giros	\N	\N	2	819
1573	1741	\N	\N	303	marrieds fungic gasogenes obnoxiously dismounting	\N	\N	2	304
1573	1741	\N	\N	303	marrieds fungic gasogenes obnoxiously dismounting	\N	\N	2	306
1578	1579	\N	\N	1582	measurage tonsils pasturage thurifer teazle fringier rhythmical wastebaskets powderer	\N	\N	2	1581
1578	1579	\N	\N	1582	measurage tonsils pasturage thurifer teazle fringier rhythmical wastebaskets powderer	\N	\N	2	1583
1588	1589	\N	\N	36	resonates overbites terminals giros podgy vagus	\N	\N	2	587
1588	1589	\N	\N	36	resonates overbites terminals giros podgy vagus	\N	\N	2	1591
1599	1757	\N	\N	270	nigglings midmonths labium peeped daydreams permuting immediately canzona	\N	\N	2	998
1599	1757	\N	\N	270	nigglings midmonths labium peeped daydreams permuting immediately canzona	\N	\N	2	1759
1600	2660	\N	\N	270	podgy vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	1376
1600	2660	\N	\N	270	podgy vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	1759
1604	2955	\N	\N	2954	lobsters careering triplets hepatics colonies defalcate transplantations forfends voucherable	\N	\N	2	555
1604	2955	\N	\N	2954	lobsters careering triplets hepatics colonies defalcate transplantations forfends voucherable	\N	\N	2	2244
1605	3044	\N	\N	2954	blowpipe varies thickest machinability orbiters tormentor owner zanier	\N	\N	2	555
1605	3044	\N	\N	2954	blowpipe varies thickest machinability orbiters tormentor owner zanier	\N	\N	2	2244
1616	1878	\N	\N	1815	teardown margarins inconvenience triunities dipped votarists kilogram timbrel presell	\N	\N	2	589
1616	1878	\N	\N	1815	teardown margarins inconvenience triunities dipped votarists kilogram timbrel presell	\N	\N	2	1678
1625	2622	\N	\N	1624	vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	326
1625	2622	\N	\N	1624	vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	674
1630	1806	\N	\N	339	neurological warranter flashings oops detonations chippering photospherically	\N	\N	2	555
1630	1806	\N	\N	339	neurological warranter flashings oops detonations chippering photospherically	\N	\N	2	715
1643	1684	\N	\N	1683	scrapped prat islanded burlily thanklessly swiveled polers oinked	\N	\N	2	1310
1643	1684	\N	\N	1683	scrapped prat islanded burlily thanklessly swiveled polers oinked	\N	\N	2	1380
1647	2132	\N	\N	1228	claymores shiftlessly feedstuffs lyricizing hierarchs composedly taunting dragged	\N	\N	2	294
1647	2132	\N	\N	1228	claymores shiftlessly feedstuffs lyricizing hierarchs composedly taunting dragged	\N	\N	2	1226
1649	3011	\N	\N	1204	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	\N	\N	2	449
1649	3011	\N	\N	1204	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	\N	\N	2	2831
1656	2351	\N	\N	1583	zanier corkscrewed promiscuousness clewed reassemble hesitation fainting	\N	\N	2	1413
1656	2351	\N	\N	1583	zanier corkscrewed promiscuousness clewed reassemble hesitation fainting	\N	\N	2	2350
1668	1837	\N	\N	712	hulled preexamination oralogy tibetans slavishly hipless prs	\N	\N	2	1179
1668	1837	\N	\N	712	hulled preexamination oralogy tibetans slavishly hipless prs	\N	\N	2	1319
1669	1751	\N	\N	712	chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical	\N	\N	2	1179
1669	1751	\N	\N	712	chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical	\N	\N	2	1319
1670	2053	\N	\N	2054	xix recollected householder overeducated objurgate treaties preprocessor despising loftily	\N	\N	2	710
1670	2053	\N	\N	2054	xix recollected householder overeducated objurgate treaties preprocessor despising loftily	\N	\N	2	1928
1675	1676	\N	\N	1678	colonies defalcate transplantations forfends	\N	\N	2	286
1675	1676	\N	\N	1678	colonies defalcate transplantations forfends	\N	\N	2	454
1707	2890	\N	\N	1562	taunting dragged lobsters careering triplets hepatics colonies defalcate transplantations	\N	\N	2	1048
1707	2890	\N	\N	1562	taunting dragged lobsters careering triplets hepatics colonies defalcate transplantations	\N	\N	2	2655
1712	1713	\N	\N	195	neologic intermuscular fobbed transcribed	\N	\N	2	196
1712	1713	\N	\N	195	neologic intermuscular fobbed transcribed	\N	\N	2	1209
1725	1728	\N	\N	1727	powderer immigrates inserter plights corollaries	\N	\N	2	1089
1725	1728	\N	\N	1727	powderer immigrates inserter plights corollaries	\N	\N	2	1726
1733	1735	\N	\N	23	phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers	\N	\N	2	821
1733	1735	\N	\N	23	phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers	\N	\N	2	1446
1738	2781	\N	\N	2783	votarists kilogram timbrel presell	\N	\N	2	340
1738	2781	\N	\N	2783	votarists kilogram timbrel presell	\N	\N	2	2167
1760	1762	\N	\N	628	isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids	\N	\N	2	516
1760	1762	\N	\N	628	isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids	\N	\N	2	629
1785	2899	\N	\N	641	succulently marquise underlaid neurosurgeon innervated hunts	\N	\N	2	642
1785	2899	\N	\N	641	succulently marquise underlaid neurosurgeon innervated hunts	\N	\N	2	645
1789	2761	\N	\N	1946	allayed zinged fridge stained unintentional antiquarians dilutes quantitatively shovels	\N	\N	2	259
1789	2761	\N	\N	1946	allayed zinged fridge stained unintentional antiquarians dilutes quantitatively shovels	\N	\N	2	519
1791	3033	\N	\N	1790	surges preheats loggias reconciliating photocatalyst lenity tautological	\N	\N	2	322
1791	3033	\N	\N	1790	surges preheats loggias reconciliating photocatalyst lenity tautological	\N	\N	2	2323
1794	2005	\N	\N	1357	tuberculoses environs hulled preexamination oralogy tibetans slavishly hipless	\N	\N	2	1329
1794	2005	\N	\N	1357	tuberculoses environs hulled preexamination oralogy tibetans slavishly hipless	\N	\N	2	2004
1795	2346	\N	\N	1357	labium peeped daydreams permuting immediately canzona interrelated	\N	\N	2	1051
1795	2346	\N	\N	1357	labium peeped daydreams permuting immediately canzona interrelated	\N	\N	2	1568
1800	2905	\N	\N	2027	triplets hepatics colonies defalcate	\N	\N	2	69
1800	2905	\N	\N	2027	triplets hepatics colonies defalcate	\N	\N	2	332
1804	2057	\N	\N	2056	retorts insoles stockman queening	\N	\N	2	1054
1804	2057	\N	\N	2056	retorts insoles stockman queening	\N	\N	2	2055
1811	1812	\N	\N	1541	nethermost nonfiction retrogressions eliminates unknowns mongoloids danker raunchiness perspicuously	\N	\N	2	1419
1811	1812	\N	\N	1541	nethermost nonfiction retrogressions eliminates unknowns mongoloids danker raunchiness perspicuously	\N	\N	2	1813
1817	2427	\N	\N	2426	zanier corkscrewed promiscuousness clewed reassemble hesitation fainting	\N	\N	2	324
1817	2427	\N	\N	2426	zanier corkscrewed promiscuousness clewed reassemble hesitation fainting	\N	\N	2	2425
1827	1898	\N	\N	1678	orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble hesitation	\N	\N	2	286
1827	1898	\N	\N	1678	orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble hesitation	\N	\N	2	454
1828	1830	\N	\N	21	podgy vagus kinkiest xix recollected householder	\N	\N	2	20
1828	1830	\N	\N	21	podgy vagus kinkiest xix recollected householder	\N	\N	2	843
1836	3055	\N	\N	2607	skimpiest outpoured dissociated heartier petitionee brill	\N	\N	2	1462
1836	3055	\N	\N	2607	skimpiest outpoured dissociated heartier petitionee brill	\N	\N	2	2431
1848	2725	\N	\N	2147	paralyzingly pouchy surrejoinders chestiest measurage tonsils pasturage	\N	\N	2	1356
1848	2725	\N	\N	2147	paralyzingly pouchy surrejoinders chestiest measurage tonsils pasturage	\N	\N	2	1414
1853	3008	\N	\N	2756	reallocating aslope seawaters ruminative patronly hydrozoon webbier foxiness toddy	\N	\N	2	1057
1853	3008	\N	\N	2756	reallocating aslope seawaters ruminative patronly hydrozoon webbier foxiness toddy	\N	\N	2	2449
1864	2020	\N	\N	915	surmisers satisfying undamped sharpers forbearer	\N	\N	2	720
1864	2020	\N	\N	915	surmisers satisfying undamped sharpers forbearer	\N	\N	2	1952
1865	1866	\N	\N	1868	lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	\N	\N	2	329
1865	1866	\N	\N	1868	lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	\N	\N	2	1867
1870	2937	\N	\N	48	apnea maxillary dumpers bering evasiveness toto	\N	\N	2	46
1870	2937	\N	\N	48	apnea maxillary dumpers bering evasiveness toto	\N	\N	2	382
1871	1872	\N	\N	1369	tuberculoses environs hulled preexamination oralogy	\N	\N	2	777
1871	1872	\N	\N	1369	tuberculoses environs hulled preexamination oralogy	\N	\N	2	921
1875	3071	\N	\N	895	barrens emanative blowpipe varies	\N	\N	2	1125
1875	3071	\N	\N	895	barrens emanative blowpipe varies	\N	\N	2	1410
1897	2876	\N	\N	2623	reminds teratoid coadjutors thuggeries nondestructive	\N	\N	2	1895
1897	2876	\N	\N	2623	reminds teratoid coadjutors thuggeries nondestructive	\N	\N	2	2160
1907	2975	\N	\N	2910	presell woodcraft reupholstered xerosis steamers neurological warranter	\N	\N	2	1418
1907	2975	\N	\N	2910	presell woodcraft reupholstered xerosis steamers neurological warranter	\N	\N	2	1905
1910	2949	\N	\N	1683	bewigged playgoers cheques batting	\N	\N	2	566
1910	2949	\N	\N	1683	bewigged playgoers cheques batting	\N	\N	2	2669
1917	2845	\N	\N	2323	oralogy tibetans slavishly hipless prs bluejays	\N	\N	2	277
1917	2845	\N	\N	2323	oralogy tibetans slavishly hipless prs bluejays	\N	\N	2	2096
1920	3073	\N	\N	2127	dwarflike effulgences coreless tuberculoses environs hulled preexamination	\N	\N	2	1918
1920	3073	\N	\N	2127	dwarflike effulgences coreless tuberculoses environs hulled preexamination	\N	\N	2	2272
1930	2543	\N	\N	1194	retrogressions eliminates unknowns mongoloids danker raunchiness perspicuously disjoined nigglings	\N	\N	2	1191
1930	2543	\N	\N	1194	retrogressions eliminates unknowns mongoloids danker raunchiness perspicuously disjoined nigglings	\N	\N	2	1192
1934	2505	\N	\N	1868	anesthetization undermentioned outflanking funnyman	\N	\N	2	971
1934	2505	\N	\N	1868	anesthetization undermentioned outflanking funnyman	\N	\N	2	1775
1936	2684	\N	\N	1868	swifters redigesting ostinato recalculation safest	\N	\N	2	971
1936	2684	\N	\N	1868	swifters redigesting ostinato recalculation safest	\N	\N	2	1775
1941	2208	\N	\N	146	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill neologic	\N	\N	2	701
1941	2208	\N	\N	146	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill neologic	\N	\N	2	702
1944	3006	\N	\N	1891	bedstraws thoughtless elation swampland earings	\N	\N	2	144
1944	3006	\N	\N	1891	bedstraws thoughtless elation swampland earings	\N	\N	2	1415
1981	2968	\N	\N	457	interrelated cooked reformers goodwife technicolor plenishes	\N	\N	2	460
1981	2968	\N	\N	457	interrelated cooked reformers goodwife technicolor plenishes	\N	\N	2	1382
1983	2265	\N	\N	1458	nethermost nonfiction retrogressions eliminates unknowns mongoloids danker raunchiness	\N	\N	2	866
1983	2265	\N	\N	1458	nethermost nonfiction retrogressions eliminates unknowns mongoloids danker raunchiness	\N	\N	2	1459
1988	2730	\N	\N	2731	renege briefless regularities planarity stubborner	\N	\N	2	577
1988	2730	\N	\N	2731	renege briefless regularities planarity stubborner	\N	\N	2	2251
1990	1992	\N	\N	1868	dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties	\N	\N	2	1260
1990	1992	\N	\N	1868	dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties	\N	\N	2	1993
1997	2389	\N	\N	628	neologic intermuscular fobbed transcribed swifters redigesting ostinato recalculation	\N	\N	2	1092
1997	2389	\N	\N	628	neologic intermuscular fobbed transcribed swifters redigesting ostinato recalculation	\N	\N	2	2270
1998	2822	\N	\N	628	preheats loggias reconciliating photocatalyst lenity tautological	\N	\N	2	516
1998	2822	\N	\N	628	preheats loggias reconciliating photocatalyst lenity tautological	\N	\N	2	629
1999	2785	\N	\N	628	recollected householder overeducated objurgate treaties preprocessor despising loftily yabber	\N	\N	2	874
1999	2785	\N	\N	628	recollected householder overeducated objurgate treaties preprocessor despising loftily yabber	\N	\N	2	1092
2000	2742	\N	\N	628	tetrachlorides loutish polygony malines	\N	\N	2	874
2000	2742	\N	\N	628	tetrachlorides loutish polygony malines	\N	\N	2	1092
2007	2359	\N	\N	457	cliffhanger entailments reindexed bedstraws	\N	\N	2	1382
2007	2359	\N	\N	457	cliffhanger entailments reindexed bedstraws	\N	\N	2	2360
2034	2565	\N	\N	343	jeered immunopathology addends surveiled wagers	\N	\N	2	2032
2034	2565	\N	\N	343	jeered immunopathology addends surveiled wagers	\N	\N	2	2205
2048	2052	\N	\N	1843	nondestructive maladjustments subpartnership cordilleras recirculations alkalin	\N	\N	2	681
2048	2052	\N	\N	1843	nondestructive maladjustments subpartnership cordilleras recirculations alkalin	\N	\N	2	2051
2087	3039	\N	\N	1276	resonates overbites terminals giros podgy vagus kinkiest	\N	\N	2	466
2087	3039	\N	\N	1276	resonates overbites terminals giros podgy vagus kinkiest	\N	\N	2	822
2088	2501	\N	\N	1276	technicolor plenishes nippy bounden occulters blubberer amenities desecrated	\N	\N	2	466
2088	2501	\N	\N	1276	technicolor plenishes nippy bounden occulters blubberer amenities desecrated	\N	\N	2	822
2089	2747	\N	\N	1276	safest signiory latchets inflecting	\N	\N	2	725
2089	2747	\N	\N	1276	safest signiory latchets inflecting	\N	\N	2	1274
2090	2092	\N	\N	1787	nippy bounden occulters blubberer amenities desecrated tetrachlorides loutish polygony	\N	\N	2	1696
2090	2092	\N	\N	1787	nippy bounden occulters blubberer amenities desecrated tetrachlorides loutish polygony	\N	\N	2	2091
2095	2555	\N	\N	2094	chromas oats pulling leatheriness witchy horologe bigamistic furrows	\N	\N	2	2404
2095	2555	\N	\N	2094	chromas oats pulling leatheriness witchy horologe bigamistic furrows	\N	\N	2	2453
2098	3070	\N	\N	2323	excretions recelebrating dually plateauing reoccupations embossers cerebrum	\N	\N	2	1073
2098	3070	\N	\N	2323	excretions recelebrating dually plateauing reoccupations embossers cerebrum	\N	\N	2	2096
2101	2354	\N	\N	2323	overeducated objurgate treaties preprocessor despising loftily yabber reprovingly blungers	\N	\N	2	1073
2101	2354	\N	\N	2323	overeducated objurgate treaties preprocessor despising loftily yabber reprovingly blungers	\N	\N	2	2096
2108	2487	\N	\N	36	commuted lachrymation floweret arcadian acridities unrealistic substituting surges	\N	\N	2	1106
2108	2487	\N	\N	36	commuted lachrymation floweret arcadian acridities unrealistic substituting surges	\N	\N	2	2227
2110	2111	\N	\N	1194	slavishly hipless prs bluejays cuppier nonsurgical	\N	\N	2	597
2110	2111	\N	\N	1194	slavishly hipless prs bluejays cuppier nonsurgical	\N	\N	2	1193
2121	2977	\N	\N	1839	ostinato recalculation safest signiory	\N	\N	2	1705
2121	2977	\N	\N	1839	ostinato recalculation safest signiory	\N	\N	2	2064
2128	2438	\N	\N	1787	latchets inflecting trephines hops	\N	\N	2	348
2128	2438	\N	\N	1787	latchets inflecting trephines hops	\N	\N	2	2147
2134	2136	\N	\N	712	neologic intermuscular fobbed transcribed swifters redigesting ostinato recalculation	\N	\N	2	349
2134	2136	\N	\N	712	neologic intermuscular fobbed transcribed swifters redigesting ostinato recalculation	\N	\N	2	2137
2141	3000	\N	\N	1868	treaties preprocessor despising loftily	\N	\N	2	1260
2141	3000	\N	\N	1868	treaties preprocessor despising loftily	\N	\N	2	1993
2150	2397	\N	\N	2241	flashings oops detonations chippering photospherically pouchiest	\N	\N	2	1902
2150	2397	\N	\N	2241	flashings oops detonations chippering photospherically pouchiest	\N	\N	2	2398
2169	2984	\N	\N	907	embrocation casteless uroliths sashes	\N	\N	2	908
2169	2984	\N	\N	907	embrocation casteless uroliths sashes	\N	\N	2	2117
2170	2609	\N	\N	907	yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments subpartnership	\N	\N	2	908
2170	2609	\N	\N	907	yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments subpartnership	\N	\N	2	2117
2179	2287	\N	\N	48	dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties	\N	\N	2	382
2179	2287	\N	\N	48	dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties	\N	\N	2	529
2183	2972	\N	\N	1194	firefanged skeins equalled sandwiching	\N	\N	2	597
2183	2972	\N	\N	1194	firefanged skeins equalled sandwiching	\N	\N	2	1193
2191	2498	\N	\N	23	floweret arcadian acridities unrealistic substituting surges preheats loggias reconciliating	\N	\N	2	464
2191	2498	\N	\N	23	floweret arcadian acridities unrealistic substituting surges preheats loggias reconciliating	\N	\N	2	821
2197	2199	\N	\N	2198	antiquarians dilutes quantitatively shovels	\N	\N	2	169
2197	2199	\N	\N	2198	antiquarians dilutes quantitatively shovels	\N	\N	2	344
2255	2553	\N	\N	2533	yeller cognizably reminds teratoid	\N	\N	2	1188
2255	2553	\N	\N	2533	yeller cognizably reminds teratoid	\N	\N	2	1409
2260	2261	\N	\N	53	napoleons rifer splinting surmisers satisfying undamped sharpers forbearer	\N	\N	2	50
2260	2261	\N	\N	53	napoleons rifer splinting surmisers satisfying undamped sharpers forbearer	\N	\N	2	51
2273	2872	\N	\N	348	occulters blubberer amenities desecrated	\N	\N	2	1557
2273	2872	\N	\N	348	occulters blubberer amenities desecrated	\N	\N	2	2272
2276	2277	\N	\N	1468	hierarchs composedly taunting dragged lobsters careering triplets hepatics	\N	\N	2	1466
2276	2277	\N	\N	1468	hierarchs composedly taunting dragged lobsters careering triplets hepatics	\N	\N	2	1467
2281	2405	\N	\N	201	loopholing tattles irradiates befriends insinuators restorers rebroadcasting grousing overdrinking	\N	\N	2	1044
2281	2405	\N	\N	201	loopholing tattles irradiates befriends insinuators restorers rebroadcasting grousing overdrinking	\N	\N	2	2279
2310	3030	\N	\N	2533	technicolor plenishes nippy bounden	\N	\N	2	82
2310	3030	\N	\N	2533	technicolor plenishes nippy bounden	\N	\N	2	334
2319	2925	\N	\N	2339	circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils pasturage	\N	\N	2	155
2319	2925	\N	\N	2339	circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils pasturage	\N	\N	2	2926
2327	2329	\N	\N	1194	swifters redigesting ostinato recalculation safest signiory	\N	\N	2	597
2327	2329	\N	\N	1194	swifters redigesting ostinato recalculation safest signiory	\N	\N	2	2330
2333	2334	\N	\N	1541	reconciliating photocatalyst lenity tautological jambing sodality outcrop	\N	\N	2	1419
2333	2334	\N	\N	1541	reconciliating photocatalyst lenity tautological jambing sodality outcrop	\N	\N	2	1813
2361	2870	\N	\N	290	subpartnership cordilleras recirculations alkalin	\N	\N	2	289
2361	2870	\N	\N	290	subpartnership cordilleras recirculations alkalin	\N	\N	2	2159
2364	2906	\N	\N	290	isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids danker	\N	\N	2	289
2364	2906	\N	\N	290	isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids danker	\N	\N	2	2159
2370	2386	\N	\N	28	fobbed transcribed swifters redigesting ostinato recalculation safest	\N	\N	2	27
2370	2386	\N	\N	28	fobbed transcribed swifters redigesting ostinato recalculation safest	\N	\N	2	29
2383	2384	\N	\N	2385	loathly cancels debiting parrots paraguayans	\N	\N	2	341
2383	2384	\N	\N	2385	loathly cancels debiting parrots paraguayans	\N	\N	2	1709
2402	2856	\N	\N	21	gunneries exorcises pirog desexes	\N	\N	2	20
2402	2856	\N	\N	21	gunneries exorcises pirog desexes	\N	\N	2	843
2436	2563	\N	\N	2178	raunchiness perspicuously disjoined nigglings midmonths labium peeped	\N	\N	2	464
2436	2563	\N	\N	2178	raunchiness perspicuously disjoined nigglings midmonths labium peeped	\N	\N	2	1411
2468	2839	\N	\N	2135	loutish polygony malines cliffhanger entailments reindexed bedstraws thoughtless elation	\N	\N	2	462
2468	2839	\N	\N	2135	loutish polygony malines cliffhanger entailments reindexed bedstraws thoughtless elation	\N	\N	2	2638
2511	3021	\N	\N	816	ostinato recalculation safest signiory latchets inflecting trephines hops exec	\N	\N	2	833
2511	3021	\N	\N	816	ostinato recalculation safest signiory latchets inflecting trephines hops exec	\N	\N	2	1602
2512	2835	\N	\N	335	preexamination oralogy tibetans slavishly hipless prs bluejays cuppier nonsurgical	\N	\N	2	1904
2512	2835	\N	\N	335	preexamination oralogy tibetans slavishly hipless prs bluejays cuppier nonsurgical	\N	\N	2	2228
2557	2720	\N	\N	1204	yabber reprovingly blungers dwarflike effulgences coreless	\N	\N	2	449
2557	2720	\N	\N	1204	yabber reprovingly blungers dwarflike effulgences coreless	\N	\N	2	753
2585	2588	\N	\N	2586	addends surveiled wagers joysticks nonliving agric	\N	\N	2	2382
2585	2588	\N	\N	2586	addends surveiled wagers joysticks nonliving agric	\N	\N	2	2587
2728	2740	\N	\N	1678	photospherically pouchiest canvasses pyorrheas cartons acquirable refocus vividness	\N	\N	2	454
2728	2740	\N	\N	1678	photospherically pouchiest canvasses pyorrheas cartons acquirable refocus vividness	\N	\N	2	2204
\.



COPY "Person" ("ID", name, email, "assignedByReviewer", "TYPE") FROM stdin;
459	Jake Bober	Jake.Bober@secretresearch.tld	\N	2
1437	Fullara Mohsin	Fullara.Mohsin@secretresearch.tld	\N	2
555	Lanzo Buseck	Lanzo.Buseck@secretresearch.tld	\N	2
462	Ludovica Diekmann	Ludovica.Diekmann@secretresearch.tld	\N	2
1632	Elvita Zielke	Elvita.Zielke@secretresearch.tld	\N	2
158	Trillare Stukel	Trillare.Stukel@secretresearch.tld	\N	2
1026	Adamanta Schlitt	Adamanta.Schlitt@secretresearch.tld	\N	2
711	Teana Stallworth	Teana.Stallworth@secretresearch.tld	\N	2
1448	Wicus Kastendieck	Wicus.Kastendieck@secretresearch.tld	\N	2
1304	Tekusa Houlberg	Tekusa.Houlberg@secretresearch.tld	\N	2
1044	Matsa Scheer	Matsa.Scheer@secretresearch.tld	\N	2
1254	Saraswathi Knickman	Saraswathi.Knickman@secretresearch.tld	\N	2
986	Zeenab Lasane	Zeenab.Lasane@secretresearch.tld	\N	2
321	Unkei Whitfield	Unkei.Whitfield@secretresearch.tld	\N	2
626	Aetos Bitar	Aetos.Bitar@secretresearch.tld	\N	2
334	Petros Josefy	Petros.Josefy@secretresearch.tld	\N	2
1719	Araminta Macumber	Araminta.Macumber@secretresearch.tld	\N	2
1965	LaReina Iqbal	LaReina.Iqbal@secretresearch.tld	\N	2
1737	Lone Pavese	Lone.Pavese@secretresearch.tld	\N	2
1902	Ceanna Vangoff	Ceanna.Vangoff@secretresearch.tld	\N	2
2123	Letizia Madaras	Letizia.Madaras@secretresearch.tld	\N	2
600	Toku Synowiec	Toku.Synowiec@secretresearch.tld	\N	2
1416	Gerakna Ryneer	Gerakna.Ryneer@secretresearch.tld	\N	2
2091	Goncalo Gahm	Goncalo.Gahm@secretresearch.tld	\N	2
944	Ustin Behm	Ustin.Behm@secretresearch.tld	\N	2
1000	Luitfriede Westmark	Luitfriede.Westmark@secretresearch.tld	\N	2
277	Tienne Segraves	Tienne.Segraves@secretresearch.tld	\N	2
200	Britney Gong	Britney.Gong@secretresearch.tld	\N	2
1142	Shaka Enget	Shaka.Enget@secretresearch.tld	\N	2
442	Chebi Selking	Chebi.Selking@secretresearch.tld	\N	2
2341	Gerke Ostermeyer	Gerke.Ostermeyer@secretresearch.tld	\N	2
322	Gulielma Arce	Gulielma.Arce@secretresearch.tld	\N	2
1174	Notburg Towber	Notburg.Towber@secretresearch.tld	\N	2
1360	Timun Silverstein	Timun.Silverstein@secretresearch.tld	\N	2
1618	Khaalida Dire	Khaalida.Dire@secretresearch.tld	\N	2
957	Tetsuya Deerdoff	Tetsuya.Deerdoff@secretresearch.tld	\N	2
881	Fernanda Hokutan	Fernanda.Hokutan@secretresearch.tld	\N	2
1011	Demetria Tramonti	Demetria.Tramonti@secretresearch.tld	\N	2
17	Cathy Phebus	Cathy.Phebus@secretresearch.tld	\N	2
193	Ursuel Eskind	Ursuel.Eskind@secretresearch.tld	\N	2
2312	Bakhteiarova Amlin	Bakhteiarova.Amlin@secretresearch.tld	\N	2
2360	Tasia Ellenburg	Tasia.Ellenburg@secretresearch.tld	\N	2
552	Hieronim Mccaig	Hieronim.Mccaig@secretresearch.tld	\N	2
332	Ignatius Beausoleil	Ignatius.Beausoleil@secretresearch.tld	\N	2
2008	Iaroia Korth	Iaroia.Korth@secretresearch.tld	\N	2
694	Miranda Leinen	Miranda.Leinen@secretresearch.tld	\N	2
647	Ehud Bazzle	Ehud.Bazzle@secretresearch.tld	\N	2
2082	Isamu Cokely	Isamu.Cokely@secretresearch.tld	\N	2
1335	Reece Raburn	Reece.Raburn@secretresearch.tld	\N	2
2587	Shaaheen Latu	Shaaheen.Latu@secretresearch.tld	\N	2
2137	Casandra Shire	Casandra.Shire@secretresearch.tld	\N	2
768	Nakamaro Zinkievich	Nakamaro.Zinkievich@secretresearch.tld	\N	2
545	Elea Kossak	Elea.Kossak@secretresearch.tld	\N	2
660	Dell Kosel	Dell.Kosel@secretresearch.tld	\N	2
2061	Bailee Chabolla	Bailee.Chabolla@secretresearch.tld	\N	2
729	Adolfa Leuthauser	Adolfa.Leuthauser@secretresearch.tld	\N	2
344	Justino Bedenfield	Justino.Bedenfield@secretresearch.tld	\N	2
1467	Ravati Boyarsky	Ravati.Boyarsky@secretresearch.tld	\N	2
946	Lavina Brunskill	Lavina.Brunskill@secretresearch.tld	\N	2
830	Mufeed Nwankwo	Mufeed.Nwankwo@secretresearch.tld	\N	2
186	Toyoshige Annen	Toyoshige.Annen@secretresearch.tld	\N	2
1696	Cadell Parral	Cadell.Parral@secretresearch.tld	\N	2
893	Janita Bolieu	Janita.Bolieu@secretresearch.tld	\N	2
1672	Fujio Hocke	Fujio.Hocke@secretresearch.tld	\N	2
225	Mimi Stremmel	Mimi.Stremmel@secretresearch.tld	\N	2
1855	Gerulf Githens	Gerulf.Githens@secretresearch.tld	\N	2
1867	Dawn Lauinger	Dawn.Lauinger@secretresearch.tld	\N	2
1415	Leopoldina Alvey	Leopoldina.Alvey@secretresearch.tld	\N	2
1412	Cyril Croslen	Cyril.Croslen@secretresearch.tld	\N	2
1213	Zhona Aden	Zhona.Aden@secretresearch.tld	\N	2
2420	Aleydis Virgadamo	Aleydis.Virgadamo@secretresearch.tld	\N	2
876	Catharine Waltmann	Catharine.Waltmann@secretresearch.tld	\N	2
301	Tashiya Marrable	Tashiya.Marrable@secretresearch.tld	\N	2
339	Heidelinde Kosse	Heidelinde.Kosse@secretresearch.tld	\N	2
1583	Aleece Thorn	Aleece.Thorn@secretresearch.tld	\N	2
340	Rayyana Scollan	Rayyana.Scollan@secretresearch.tld	\N	2
581	Honey Eidinger	Honey.Eidinger@secretresearch.tld	\N	2
1862	Cato Himmelwright	Cato.Himmelwright@secretresearch.tld	\N	2
380	Gota Dorff	Gota.Dorff@secretresearch.tld	\N	2
460	Bernharda Riese	Bernharda.Riese@secretresearch.tld	\N	2
115	Vongfong Sowells	Vongfong.Sowells@secretresearch.tld	\N	2
828	Gwydion Gowans	Gwydion.Gowans@secretresearch.tld	\N	2
2147	Llwyr Fagerstrom	Llwyr.Fagerstrom@secretresearch.tld	\N	2
1409	Ryo Zanders	Ryo.Zanders@secretresearch.tld	\N	2
345	Okichi Spradlin	Okichi.Spradlin@secretresearch.tld	\N	2
82	Baptist Schubert	Baptist.Schubert@secretresearch.tld	\N	2
155	Blair Cappucci	Blair.Cappucci@secretresearch.tld	\N	2
604	Gisela Coric	Gisela.Coric@secretresearch.tld	\N	2
2270	Odgar Oguin	Odgar.Oguin@secretresearch.tld	\N	2
1709	Vyshia Waldall	Vyshia.Waldall@secretresearch.tld	\N	2
1829	Breana Scheffler	Breana.Scheffler@secretresearch.tld	\N	2
2043	Anbessa Gulde	Anbessa.Gulde@secretresearch.tld	\N	2
324	Vincenzio Compos	Vincenzio.Compos@secretresearch.tld	\N	2
341	Kallie Bednarek	Kallie.Bednarek@secretresearch.tld	\N	2
2173	Valerius Mcconnell	Valerius.Mcconnell@secretresearch.tld	\N	2
288	Nockten Outhier	Nockten.Outhier@secretresearch.tld	\N	2
1781	Stephonjia Hetjonk	Stephonjia.Hetjonk@secretresearch.tld	\N	2
1664	Tanja Lockmiller	Tanja.Lockmiller@secretresearch.tld	\N	2
735	Varun Fissori	Varun.Fissori@secretresearch.tld	\N	2
2065	Loleta Prevost	Loleta.Prevost@secretresearch.tld	\N	2
291	Carolann Lackland	Carolann.Lackland@secretresearch.tld	\N	2
833	Karlus Guardipee	Karlus.Guardipee@secretresearch.tld	\N	2
303	Faustine Agriesti	Faustine.Agriesti@secretresearch.tld	\N	2
895	Mudri Gamero	Mudri.Gamero@secretresearch.tld	\N	2
606	Briga Lyman	Briga.Lyman@secretresearch.tld	\N	2
2423	Kazuhiko Campas	Kazuhiko.Campas@secretresearch.tld	\N	2
605	Melitina Alviar	Melitina.Alviar@secretresearch.tld	\N	2
1459	Hellmuth Presley	Hellmuth.Presley@secretresearch.tld	\N	2
927	Aleksndra Roncskevitz	Aleksndra.Roncskevitz@secretresearch.tld	\N	2
2228	Vincenzo Baptist	Vincenzo.Baptist@secretresearch.tld	\N	2
782	Dorinda Cuchiara	Dorinda.Cuchiara@secretresearch.tld	\N	2
259	Chekhina Binkowski	Chekhina.Binkowski@secretresearch.tld	\N	2
2070	Fikriyya Siddiq	Fikriyya.Siddiq@secretresearch.tld	\N	2
821	Aedd Lurye	Aedd.Lurye@secretresearch.tld	\N	2
2229	Arcadia Granade	Arcadia.Granade@secretresearch.tld	\N	2
921	Swidbert Repka	Swidbert.Repka@secretresearch.tld	\N	2
86	Virgilio Englander	Virgilio.Englander@secretresearch.tld	\N	2
936	Bhavana Bartling	Bhavana.Bartling@secretresearch.tld	\N	2
623	Baucis Campese	Baucis.Campese@secretresearch.tld	\N	2
1462	Frederick Larabee	Frederick.Larabee@secretresearch.tld	\N	2
1591	Augusto Kempson	Augusto.Kempson@secretresearch.tld	\N	2
1106	Volotkoveia Klees	Volotkoveia.Klees@secretresearch.tld	\N	2
998	Ekantika Bisogno	Ekantika.Bisogno@secretresearch.tld	\N	2
2227	Vseslava Szollosi	Vseslava.Szollosi@secretresearch.tld	\N	2
1839	Donatella Doxie	Donatella.Doxie@secretresearch.tld	\N	2
1301	Miles Manero	Miles.Manero@secretresearch.tld	\N	2
182	LeVaughan Laity	LeVaughan.Laity@secretresearch.tld	\N	2
272	Shandee Finnicum	Shandee.Finnicum@secretresearch.tld	\N	2
1262	Favio Mutherspaw	Favio.Mutherspaw@secretresearch.tld	\N	2
275	Gianna Lomascolo	Gianna.Lomascolo@secretresearch.tld	\N	2
1051	Gisbert Tircuit	Gisbert.Tircuit@secretresearch.tld	\N	2
1071	Resaunna Swanagan	Resaunna.Swanagan@secretresearch.tld	\N	2
1891	Constantino Thielen	Constantino.Thielen@secretresearch.tld	\N	2
1073	Madaleno Bercier	Madaleno.Bercier@secretresearch.tld	\N	2
2017	Yitzchak Rudzik	Yitzchak.Rudzik@secretresearch.tld	\N	2
1394	Jurgisr Arkins	Jurgisr.Arkins@secretresearch.tld	\N	2
1198	Fedon Ryburn	Fedon.Ryburn@secretresearch.tld	\N	2
2595	Dobry Gentges	Dobry.Gentges@secretresearch.tld	\N	2
104	Annika Forson	Annika.Forson@secretresearch.tld	\N	2
184	Araceli Ertel	Araceli.Ertel@secretresearch.tld	\N	2
1013	Mawuli Weeks	Mawuli.Weeks@secretresearch.tld	\N	2
28	Zufar Pestoni	Zufar.Pestoni@secretresearch.tld	\N	2
785	Inocente Arntzen	Inocente.Arntzen@secretresearch.tld	\N	2
2624	Ruwaid Solian	Ruwaid.Solian@secretresearch.tld	\N	2
1542	Juro Scogin	Juro.Scogin@secretresearch.tld	\N	2
1357	Adeeb Drewski	Adeeb.Drewski@secretresearch.tld	\N	2
405	Kiraanna Scherping	Kiraanna.Scherping@secretresearch.tld	\N	2
1843	Sadahige Taglialatela	Sadahige.Taglialatela@secretresearch.tld	\N	2
896	Yeva Vilardo	Yeva.Vilardo@secretresearch.tld	\N	2
802	Larah Gallaga	Larah.Gallaga@secretresearch.tld	\N	2
2586	Laomedon Sotos	Laomedon.Sotos@secretresearch.tld	\N	2
2339	Anwar Katayama	Anwar.Katayama@secretresearch.tld	\N	2
2315	Tuhfa Pedez	Tuhfa.Pedez@secretresearch.tld	\N	2
1790	Bia Klemme	Bia.Klemme@secretresearch.tld	\N	2
1787	AbdulBaasid Chilvers	AbdulBaasid.Chilvers@secretresearch.tld	\N	2
1662	Vassily Gassoway	Vassily.Gassoway@secretresearch.tld	\N	2
1070	Emong Myatt	Emong.Myatt@secretresearch.tld	\N	2
488	AbdulWaahid Cornacchio	AbdulWaahid.Cornacchio@secretresearch.tld	\N	2
2692	Ran Rubendall	Ran.Rubendall@secretresearch.tld	\N	2
1518	Catrin Pretzel	Catrin.Pretzel@secretresearch.tld	\N	2
1204	Isha Quave	Isha.Quave@secretresearch.tld	\N	2
123	Larry Espejel	Larry.Espejel@secretresearch.tld	\N	2
1720	Wrata Breier	Wrata.Breier@secretresearch.tld	\N	2
549	GopiGopika Chaisty	GopiGopika.Chaisty@secretresearch.tld	\N	2
1217	Gritt Prestage	Gritt.Prestage@secretresearch.tld	\N	2
1468	Lorina Stangle	Lorina.Stangle@secretresearch.tld	\N	2
2910	Iveska Inacio	Iveska.Inacio@secretresearch.tld	\N	2
2533	Patrido Sielaff	Patrido.Sielaff@secretresearch.tld	\N	2
1946	Pancho Rowold	Pancho.Rowold@secretresearch.tld	\N	2
770	Castalia Ryser	Castalia.Ryser@secretresearch.tld	\N	2
53	Zumruda Fishman	Zumruda.Fishman@secretresearch.tld	\N	2
1123	Daeshona Hives	Daeshona.Hives@secretresearch.tld	\N	2
749	Fedyenka Terrasi	Fedyenka.Terrasi@secretresearch.tld	\N	2
2500	Cansu Hewitt	Cansu.Hewitt@secretresearch.tld	\N	2
1438	Vasilii Crowl	Vasilii.Crowl@secretresearch.tld	\N	2
887	Tahlia Francisque	Tahlia.Francisque@secretresearch.tld	\N	2
179	Nia Drakes	Nia.Drakes@secretresearch.tld	\N	2
2009	Tashira Mounkes	Tashira.Mounkes@secretresearch.tld	\N	2
767	Sakeen Kotheimer	Sakeen.Kotheimer@secretresearch.tld	\N	2
1541	Kerry Navarrate	Kerry.Navarrate@secretresearch.tld	\N	2
1727	Nene Rhea	Nene.Rhea@secretresearch.tld	\N	2
5	Iravati Pizzolato	Iravati.Pizzolato@secretresearch.tld	\N	2
71	Terao Asley	Terao.Asley@secretresearch.tld	\N	2
161	Oleka Tommasino	Oleka.Tommasino@secretresearch.tld	\N	2
217	Eshita Whitby	Eshita.Whitby@secretresearch.tld	\N	2
238	Fabiana Demase	Fabiana.Demase@secretresearch.tld	\N	2
248	Ciara Monroig	Ciara.Monroig@secretresearch.tld	\N	2
372	Marna Crookshanks	Marna.Crookshanks@secretresearch.tld	\N	2
412	Eskil Littledave	Eskil.Littledave@secretresearch.tld	\N	2
35	Anissa Sciarretta	Anissa.Sciarretta@secretresearch.tld	\N	2
497	Blanca Ursery	Blanca.Ursery@secretresearch.tld	\N	2
520	Angel Delcarmen	Angel.Delcarmen@secretresearch.tld	\N	2
99	Katryn Volmer	Katryn.Volmer@secretresearch.tld	\N	2
633	Nisus Coby	Nisus.Coby@secretresearch.tld	\N	2
652	Lakyta Soltis	Lakyta.Soltis@secretresearch.tld	\N	2
844	Gaspara Lowell	Gaspara.Lowell@secretresearch.tld	\N	2
544	Gualtiero Hemken	Gualtiero.Hemken@secretresearch.tld	\N	2
972	Tsumemasa Lloyd	Tsumemasa.Lloyd@secretresearch.tld	\N	2
875	Teuthras Koffman	Teuthras.Koffman@secretresearch.tld	\N	2
135	Candis Barefield	Candis.Barefield@secretresearch.tld	\N	2
1129	Utathya Kreig	Utathya.Kreig@secretresearch.tld	\N	2
38	Yae Timblin	Yae.Timblin@secretresearch.tld	\N	2
126	Tetsui Zekria	Tetsui.Zekria@secretresearch.tld	\N	2
199	Claudios Lemmert	Claudios.Lemmert@secretresearch.tld	\N	2
1245	Leonora Peli	Leonora.Peli@secretresearch.tld	\N	2
143	Matysh Segobia	Matysh.Segobia@secretresearch.tld	\N	2
319	YolandaAbigail Insogna	YolandaAbigail.Insogna@secretresearch.tld	\N	2
1476	Chantrelle Gruiger	Chantrelle.Gruiger@secretresearch.tld	\N	2
1507	Salaah Elio	Salaah.Elio@secretresearch.tld	\N	2
458	Roslava Ranum	Roslava.Ranum@secretresearch.tld	\N	2
1046	Binodini Bircher	Binodini.Bircher@secretresearch.tld	\N	2
316	Bibiane Eddens	Bibiane.Eddens@secretresearch.tld	\N	2
270	nthimos Heskett	nthimos.Heskett@secretresearch.tld	\N	2
470	Lonce Jiron	Lonce.Jiron@secretresearch.tld	\N	2
710	Kumi Belidor	Kumi.Belidor@secretresearch.tld	\N	2
137	Toshiro Serey	Toshiro.Serey@secretresearch.tld	\N	2
674	Editta Servoss	Editta.Servoss@secretresearch.tld	\N	2
1356	Timotheos Cazaree	Timotheos.Cazaree@secretresearch.tld	\N	2
1319	Graud Shuker	Graud.Shuker@secretresearch.tld	\N	2
1191	Sharisha Gebhart	Sharisha.Gebhart@secretresearch.tld	\N	2
1775	Richild Brinius	Richild.Brinius@secretresearch.tld	\N	2
144	Lex Hoven	Lex.Hoven@secretresearch.tld	\N	2
810	Jermaine Mandahl	Jermaine.Mandahl@secretresearch.tld	\N	2
129	Luca Dolbin	Luca.Dolbin@secretresearch.tld	\N	2
628	Govannon Starwalt	Govannon.Starwalt@secretresearch.tld	\N	2
1329	Adok Galbiso	Adok.Galbiso@secretresearch.tld	\N	2
1159	Montrel Hadley	Montrel.Hadley@secretresearch.tld	\N	2
111	Gayle Wingrove	Gayle.Wingrove@secretresearch.tld	\N	2
1276	Lippio Llopis	Lippio.Llopis@secretresearch.tld	\N	2
1473	ris Kotter	ris.Kotter@secretresearch.tld	\N	2
971	Wira Majette	Wira.Majette@secretresearch.tld	\N	2
382	Jaen Kerechanko	Jaen.Kerechanko@secretresearch.tld	\N	2
1193	Nana Stania	Nana.Stania@secretresearch.tld	\N	2
1427	Reiko Castile	Reiko.Castile@secretresearch.tld	\N	2
822	Haimo Huesso	Haimo.Huesso@secretresearch.tld	\N	2
1581	Marzooqa Stuermer	Marzooqa.Stuermer@secretresearch.tld	\N	2
146	Hadrian Homesley	Hadrian.Homesley@secretresearch.tld	\N	2
1050	Shijo Mccullon	Shijo.Mccullon@secretresearch.tld	\N	2
327	Erbin Quimet	Erbin.Quimet@secretresearch.tld	\N	2
180	Hilmiyya Pagon	Hilmiyya.Pagon@secretresearch.tld	\N	2
2272	Jenell Harlin	Jenell.Harlin@secretresearch.tld	\N	2
720	Antares Rancourt	Antares.Rancourt@secretresearch.tld	\N	2
2202	Faas Chitty	Faas.Chitty@secretresearch.tld	\N	2
289	Muneeb Borkoski	Muneeb.Borkoski@secretresearch.tld	\N	2
27	Jedrek Beutnagel	Jedrek.Beutnagel@secretresearch.tld	\N	2
64	Clivia Kuriger	Clivia.Kuriger@secretresearch.tld	\N	2
195	Egor Braue	Egor.Braue@secretresearch.tld	\N	2
88	Johanna Buttross	Johanna.Buttross@secretresearch.tld	\N	2
1310	Kichibei Opitz	Kichibei.Opitz@secretresearch.tld	\N	2
843	Casswallawn Scheiblich	Casswallawn.Scheiblich@secretresearch.tld	\N	2
348	Dodie Tedford	Dodie.Tedford@secretresearch.tld	\N	2
1186	Akila Terlizzi	Akila.Terlizzi@secretresearch.tld	\N	2
466	Latrice Ghrist	Latrice.Ghrist@secretresearch.tld	\N	2
36	Salamon Julien	Salamon.Julien@secretresearch.tld	\N	2
2026	Rhea Platas	Rhea.Platas@secretresearch.tld	\N	2
2323	Khadija Lagerquist	Khadija.Lagerquist@secretresearch.tld	\N	2
1179	Jakoba Bueche	Jakoba.Bueche@secretresearch.tld	\N	2
451	Agamemnon Bouras	Agamemnon.Bouras@secretresearch.tld	\N	2
1568	Christophine Welke	Christophine.Welke@secretresearch.tld	\N	2
336	Marira Igler	Marira.Igler@secretresearch.tld	\N	2
629	Terza Jaremka	Terza.Jaremka@secretresearch.tld	\N	2
1055	Varuna Rakers	Varuna.Rakers@secretresearch.tld	\N	2
323	Nawwaara Roary	Nawwaara.Roary@secretresearch.tld	\N	2
1192	Hoitsu Mccahill	Hoitsu.Mccahill@secretresearch.tld	\N	2
337	Tarrant Alsbrooks	Tarrant.Alsbrooks@secretresearch.tld	\N	2
1058	Bruna Nervis	Bruna.Nervis@secretresearch.tld	\N	2
1711	Primavera Huffstickler	Primavera.Huffstickler@secretresearch.tld	\N	2
107	Saalim Velasquez	Saalim.Velasquez@secretresearch.tld	\N	2
587	Masafumi Gipson	Masafumi.Gipson@secretresearch.tld	\N	2
2491	Mokichi Schayer	Mokichi.Schayer@secretresearch.tld	\N	2
1225	Brys Robak	Brys.Robak@secretresearch.tld	\N	2
330	LaVerne Musgrave	LaVerne.Musgrave@secretresearch.tld	\N	2
725	Jaime Hasencamp	Jaime.Hasencamp@secretresearch.tld	\N	2
1352	Myshka Krishnamurthy	Myshka.Krishnamurthy@secretresearch.tld	\N	2
1759	Deucalion Panahon	Deucalion.Panahon@secretresearch.tld	\N	2
23	Marulia Bondura	Marulia.Bondura@secretresearch.tld	\N	2
1678	Pyotr Giffen	Pyotr.Giffen@secretresearch.tld	\N	2
755	Glafira Geng	Glafira.Geng@secretresearch.tld	\N	2
874	Yumiko Ginther	Yumiko.Ginther@secretresearch.tld	\N	2
1260	Kaori Leasy	Kaori.Leasy@secretresearch.tld	\N	2
2350	Ingetrud Balezentis	Ingetrud.Balezentis@secretresearch.tld	\N	2
51	Friede Malcolm	Friede.Malcolm@secretresearch.tld	\N	2
584	Iasion Kirt	Iasion.Kirt@secretresearch.tld	\N	2
1419	Sibylla Reas	Sibylla.Reas@secretresearch.tld	\N	2
1092	AbdulGhafoor Mallie	AbdulGhafoor.Mallie@secretresearch.tld	\N	2
176	Shoichi Mathey	Shoichi.Mathey@secretresearch.tld	\N	2
349	Philoctetes Macmahon	Philoctetes.Macmahon@secretresearch.tld	\N	2
468	Vernon Niemela	Vernon.Niemela@secretresearch.tld	\N	2
290	Chey Prinzing	Chey.Prinzing@secretresearch.tld	\N	2
450	Erminia Damrell	Erminia.Damrell@secretresearch.tld	\N	2
403	Jeanine Garoner	Jeanine.Garoner@secretresearch.tld	\N	2
1025	Datja Carner	Datja.Carner@secretresearch.tld	\N	2
642	Eytan Dirth	Eytan.Dirth@secretresearch.tld	\N	2
516	Crysta Mateen	Crysta.Mateen@secretresearch.tld	\N	2
1602	Li Gotay	Li.Gotay@secretresearch.tld	\N	2
454	Andromeda Arvez	Andromeda.Arvez@secretresearch.tld	\N	2
753	Mikolas Sirman	Mikolas.Sirman@secretresearch.tld	\N	2
21	Coch Foulger	Coch.Foulger@secretresearch.tld	\N	2
449	Lottchen Pillitteri	Lottchen.Pillitteri@secretresearch.tld	\N	2
597	Liska Lambourne	Liska.Lambourne@secretresearch.tld	\N	2
777	Jamie Berrie	Jamie.Berrie@secretresearch.tld	\N	2
1369	Shaunene Libera	Shaunene.Libera@secretresearch.tld	\N	2
346	Martino Nommay	Martino.Nommay@secretresearch.tld	\N	2
329	Honami Docherty	Honami.Docherty@secretresearch.tld	\N	2
1690	Heraclio Haaf	Heraclio.Haaf@secretresearch.tld	\N	2
20	Erechtheus Muschick	Erechtheus.Muschick@secretresearch.tld	\N	2
809	Korekiyo Keilholz	Korekiyo.Keilholz@secretresearch.tld	\N	2
196	Kazushige Goeppner	Kazushige.Goeppner@secretresearch.tld	\N	2
808	Toyoaki Richoux	Toyoaki.Richoux@secretresearch.tld	\N	2
1098	Julien Triveno	Julien.Triveno@secretresearch.tld	\N	2
30	Sam Mattheis	Sam.Mattheis@secretresearch.tld	\N	2
47	Lene Vosquez	Lene.Vosquez@secretresearch.tld	\N	2
228	Amora Ockmond	Amora.Ockmond@secretresearch.tld	\N	2
197	Radosha Ferioli	Radosha.Ferioli@secretresearch.tld	\N	2
396	Matro Newell	Matro.Newell@secretresearch.tld	\N	2
66	Lecia Baumeister	Lecia.Baumeister@secretresearch.tld	\N	2
524	Dine Hazzard	Dine.Hazzard@secretresearch.tld	\N	2
177	Aristomnis Dauber	Aristomnis.Dauber@secretresearch.tld	\N	2
537	Julius Aluarez	Julius.Aluarez@secretresearch.tld	\N	2
592	Faatin Bonn	Faatin.Bonn@secretresearch.tld	\N	2
615	Vedetta Pilkins	Vedetta.Pilkins@secretresearch.tld	\N	2
676	Fanaila Torain	Fanaila.Torain@secretresearch.tld	\N	2
682	Elli Asner	Elli.Asner@secretresearch.tld	\N	2
121	Chiona Holstine	Chiona.Holstine@secretresearch.tld	\N	2
317	Sabina Conde	Sabina.Conde@secretresearch.tld	\N	2
902	Emese Abadie	Emese.Abadie@secretresearch.tld	\N	2
958	Kynan Huckaby	Kynan.Huckaby@secretresearch.tld	\N	2
992	Elvis Rocasah	Elvis.Rocasah@secretresearch.tld	\N	2
1015	Yurochka Hemmer	Yurochka.Hemmer@secretresearch.tld	\N	2
691	Luzinde Krabbe	Luzinde.Krabbe@secretresearch.tld	\N	2
1160	Roseann Ora	Roseann.Ora@secretresearch.tld	\N	2
1166	Aamurie Semonick	Aamurie.Semonick@secretresearch.tld	\N	2
116	Michinori Jerko	Michinori.Jerko@secretresearch.tld	\N	2
1214	Daunte Marn	Daunte.Marn@secretresearch.tld	\N	2
1257	Parma Borgese	Parma.Borgese@secretresearch.tld	\N	2
139	Karita Sukovich	Karita.Sukovich@secretresearch.tld	\N	2
1620	Cherry Dolence	Cherry.Dolence@secretresearch.tld	\N	2
1730	Anzhela Venturelli	Anzhela.Venturelli@secretresearch.tld	\N	2
1397	Julika Smar	Julika.Smar@secretresearch.tld	\N	2
886	Mayo Warsing	Mayo.Warsing@secretresearch.tld	\N	2
1350	Alberich Dougharity	Alberich.Dougharity@secretresearch.tld	\N	2
131	Lishka Turton	Lishka.Turton@secretresearch.tld	\N	2
1819	Francisco Feighner	Francisco.Feighner@secretresearch.tld	\N	2
46	Taaliba Debrita	Taaliba.Debrita@secretresearch.tld	\N	2
2469	Libera Ahlborn	Libera.Ahlborn@secretresearch.tld	\N	2
1220	Reno Garzia	Reno.Garzia@secretresearch.tld	\N	2
331	Rufio Guitard	Rufio.Guitard@secretresearch.tld	\N	2
279	Jace Ruotolo	Jace.Ruotolo@secretresearch.tld	\N	2
701	Andrew Coplen	Andrew.Coplen@secretresearch.tld	\N	2
2416	Adalia Manalo	Adalia.Manalo@secretresearch.tld	\N	2
335	Loremarie Zissler	Loremarie.Zissler@secretresearch.tld	\N	2
693	Cc Arroyos	Cc.Arroyos@secretresearch.tld	\N	2
560	Barsha Murrain	Barsha.Murrain@secretresearch.tld	\N	2
566	Elvera Zito	Elvera.Zito@secretresearch.tld	\N	2
433	Dinora Beza	Dinora.Beza@secretresearch.tld	\N	2
819	Letje Donald	Letje.Donald@secretresearch.tld	\N	2
2064	Yo Kadi	Yo.Kadi@secretresearch.tld	\N	2
169	Janile Arne	Janile.Arne@secretresearch.tld	\N	2
2178	Podolphe Fluitt	Podolphe.Fluitt@secretresearch.tld	\N	2
2160	Anda Palomino	Anda.Palomino@secretresearch.tld	\N	2
343	AbdulRauf Strothman	AbdulRauf.Strothman@secretresearch.tld	\N	2
1279	Aracely Kuka	Aracely.Kuka@secretresearch.tld	\N	2
2127	Khynika Borwig	Khynika.Borwig@secretresearch.tld	\N	2
2731	Mabon Meardon	Mabon.Meardon@secretresearch.tld	\N	2
1821	Marianne Dacquel	Marianne.Dacquel@secretresearch.tld	\N	2
1228	Thaaqib Skender	Thaaqib.Skender@secretresearch.tld	\N	2
2054	Pippo Nascimento	Pippo.Nascimento@secretresearch.tld	\N	2
2886	Stacy Higuchi	Stacy.Higuchi@secretresearch.tld	\N	2
358	Teodora Rumney	Teodora.Rumney@secretresearch.tld	\N	2
504	Doppo Kieser	Doppo.Kieser@secretresearch.tld	\N	2
1980	Avery Jeavons	Avery.Jeavons@secretresearch.tld	\N	2
983	Kaii Bedson	Kaii.Bedson@secretresearch.tld	\N	2
1325	Zenon Denes	Zenon.Denes@secretresearch.tld	\N	2
1302	Joey Yarboro	Joey.Yarboro@secretresearch.tld	\N	2
2385	Kulthum Liverance	Kulthum.Liverance@secretresearch.tld	\N	2
1750	Yemena Knebel	Yemena.Knebel@secretresearch.tld	\N	2
2125	Anatolii Trader	Anatolii.Trader@secretresearch.tld	\N	2
1582	Krushka Minner	Krushka.Minner@secretresearch.tld	\N	2
1815	Rei Marchio	Rei.Marchio@secretresearch.tld	\N	2
2094	Gamze Skalsky	Gamze.Skalsky@secretresearch.tld	\N	2
787	Caden Failing	Caden.Failing@secretresearch.tld	\N	2
1114	Karyna Joyner	Karyna.Joyner@secretresearch.tld	\N	2
956	AbdulHaadi Castellan	AbdulHaadi.Castellan@secretresearch.tld	\N	2
641	Taurino Lizarda	Taurino.Lizarda@secretresearch.tld	\N	2
622	Winand Poulton	Winand.Poulton@secretresearch.tld	\N	2
2241	Hanan Aupperle	Hanan.Aupperle@secretresearch.tld	\N	2
215	Yahya Kulacz	Yahya.Kulacz@secretresearch.tld	\N	2
2056	Luther Corral	Luther.Corral@secretresearch.tld	\N	2
1683	Eupeithes Bevens	Eupeithes.Bevens@secretresearch.tld	\N	2
1194	Mukhtaar Grewe	Mukhtaar.Grewe@secretresearch.tld	\N	2
2027	Christine Ehlke	Christine.Ehlke@secretresearch.tld	\N	2
712	Gwalchmei Halbert	Gwalchmei.Halbert@secretresearch.tld	\N	2
201	Taariq Cariaso	Taariq.Cariaso@secretresearch.tld	\N	2
943	Godalupe Gorrell	Godalupe.Gorrell@secretresearch.tld	\N	2
385	Vicenta Hemingway	Vicenta.Hemingway@secretresearch.tld	\N	2
1624	Hanka Henness	Hanka.Henness@secretresearch.tld	\N	2
308	Jared Torgersen	Jared.Torgersen@secretresearch.tld	\N	2
2954	Trinh Brihm	Trinh.Brihm@secretresearch.tld	\N	2
130	Takuboku Aicklen	Takuboku.Aicklen@secretresearch.tld	\N	2
686	Gulika Alipio	Gulika.Alipio@secretresearch.tld	\N	2
558	Diana Gulbranson	Diana.Gulbranson@secretresearch.tld	\N	2
154	Clmence Diop	Clmence.Diop@secretresearch.tld	\N	2
1761	Kobe Guttirez	Kobe.Guttirez@secretresearch.tld	\N	2
1959	Newa Sabina	Newa.Sabina@secretresearch.tld	\N	2
2661	Yuka Heikes	Yuka.Heikes@secretresearch.tld	\N	2
2617	Cady Schweizer	Cady.Schweizer@secretresearch.tld	\N	2
1227	Stve Rockwood	Stve.Rockwood@secretresearch.tld	\N	2
1882	Idurre Lagrave	Idurre.Lagrave@secretresearch.tld	\N	2
1603	Peleus Vasseur	Peleus.Vasseur@secretresearch.tld	\N	2
2286	Loreliese Aspri	Loreliese.Aspri@secretresearch.tld	\N	2
877	Natascha Neverson	Natascha.Neverson@secretresearch.tld	\N	2
1900	Ake Crowson	Ake.Crowson@secretresearch.tld	\N	2
1004	Laiurenty Ponzi	Laiurenty.Ponzi@secretresearch.tld	\N	2
3007	Aidia Leidel	Aidia.Leidel@secretresearch.tld	\N	2
1877	Saahir Muto	Saahir.Muto@secretresearch.tld	\N	2
1803	Donzel Hohman	Donzel.Hohman@secretresearch.tld	\N	2
2247	Holda Dible	Holda.Dible@secretresearch.tld	\N	2
2699	Juichi Porep	Juichi.Porep@secretresearch.tld	\N	2
2927	Kozue Efthimiou	Kozue.Efthimiou@secretresearch.tld	\N	2
305	Nyusha Karns	Nyusha.Karns@secretresearch.tld	\N	2
2504	Almut Cargill	Almut.Cargill@secretresearch.tld	\N	2
2181	Heihachiro Parthemer	Heihachiro.Parthemer@secretresearch.tld	\N	2
1495	Vesna Pirkey	Vesna.Pirkey@secretresearch.tld	\N	2
2188	Ebizo Mincher	Ebizo.Mincher@secretresearch.tld	\N	2
2174	Elenya Oksen	Elenya.Oksen@secretresearch.tld	\N	2
2242	Maksim Kasuba	Maksim.Kasuba@secretresearch.tld	\N	2
2552	Evi Heidebrecht	Evi.Heidebrecht@secretresearch.tld	\N	2
1180	Tamary Nici	Tamary.Nici@secretresearch.tld	\N	2
923	Dewi Rappleyea	Dewi.Rappleyea@secretresearch.tld	\N	2
1580	Ayushmati Appelgren	Ayushmati.Appelgren@secretresearch.tld	\N	2
1275	Lashaune Lava	Lashaune.Lava@secretresearch.tld	\N	2
1869	Sander Garriss	Sander.Garriss@secretresearch.tld	\N	2
1402	Jokin Hytros	Jokin.Hytros@secretresearch.tld	\N	2
2366	Viktor Farrior	Viktor.Farrior@secretresearch.tld	\N	2
2520	Noel Grass	Noel.Grass@secretresearch.tld	\N	2
1522	Kyledyr Constantino	Kyledyr.Constantino@secretresearch.tld	\N	2
174	Ephrem Ruddle	Ephrem.Ruddle@secretresearch.tld	\N	2
911	Rgine Neibert	Rgine.Neibert@secretresearch.tld	\N	2
2562	Bennet Melendes	Bennet.Melendes@secretresearch.tld	\N	2
2003	Usaama Greiser	Usaama.Greiser@secretresearch.tld	\N	2
1615	Ebony Zieg	Ebony.Zieg@secretresearch.tld	\N	2
401	Yoshino Mohomed	Yoshino.Mohomed@secretresearch.tld	\N	2
2349	Sherry Mullennix	Sherry.Mullennix@secretresearch.tld	\N	2
1590	Cornelius Dolak	Cornelius.Dolak@secretresearch.tld	\N	2
1835	Zaamil Mirra	Zaamil.Mirra@secretresearch.tld	\N	2
964	Reginbald Aggas	Reginbald.Aggas@secretresearch.tld	\N	2
54	Krosa Kuney	Krosa.Kuney@secretresearch.tld	\N	2
1677	Stone Reigner	Stone.Reigner@secretresearch.tld	\N	2
2592	Ztrezena Gutman	Ztrezena.Gutman@secretresearch.tld	\N	2
794	Kanan Snowdon	Kanan.Snowdon@secretresearch.tld	\N	2
2531	Twain Sannon	Twain.Sannon@secretresearch.tld	\N	2
445	Malcolm Voelz	Malcolm.Voelz@secretresearch.tld	\N	2
1524	Girija May	Girija.May@secretresearch.tld	\N	2
928	Vas Dy	Vas.Dy@secretresearch.tld	\N	2
13	Nikkylia Foutz	Nikkylia.Foutz@secretresearch.tld	\N	2
738	Valter Soldner	Valter.Soldner@secretresearch.tld	\N	2
2377	Adolfo Kick	Adolfo.Kick@secretresearch.tld	\N	2
1312	Ximena Capan	Ximena.Capan@secretresearch.tld	\N	2
1529	Agislaos Lamoreaux	Agislaos.Lamoreaux@secretresearch.tld	\N	2
83	Kea Croshaw	Kea.Croshaw@secretresearch.tld	\N	2
227	Sho Stechlinski	Sho.Stechlinski@secretresearch.tld	\N	2
1933	Saleema Jurasek	Saleema.Jurasek@secretresearch.tld	\N	2
1854	Izarra Zackery	Izarra.Zackery@secretresearch.tld	\N	2
961	Dandrae Dorne	Dandrae.Dorne@secretresearch.tld	\N	2
2321	Suhaila Berez	Suhaila.Berez@secretresearch.tld	\N	2
19	Jenna Ovit	Jenna.Ovit@secretresearch.tld	\N	2
858	Wendell Rolens	Wendell.Rolens@secretresearch.tld	\N	2
1505	Katsumoto Tarbert	Katsumoto.Tarbert@secretresearch.tld	\N	2
1436	Glikeriia Mushrush	Glikeriia.Mushrush@secretresearch.tld	\N	2
1801	Lucrecia Rollings	Lucrecia.Rollings@secretresearch.tld	\N	2
67	Riddhi Colesar	Riddhi.Colesar@secretresearch.tld	\N	2
432	Annnees Kain	Annnees.Kain@secretresearch.tld	\N	2
1425	Ryzard Auchmoody	Ryzard.Auchmoody@secretresearch.tld	\N	2
761	Houke Luthe	Houke.Luthe@secretresearch.tld	\N	2
1629	Sama Beukema	Sama.Beukema@secretresearch.tld	\N	2
1321	Arvel Tindle	Arvel.Tindle@secretresearch.tld	\N	2
929	Alonza Galyan	Alonza.Galyan@secretresearch.tld	\N	2
1039	Dashay Stclair	Dashay.Stclair@secretresearch.tld	\N	2
1503	Darian Jill	Darian.Jill@secretresearch.tld	\N	2
1390	Pippino Kempner	Pippino.Kempner@secretresearch.tld	\N	2
2129	Haley Lotempio	Haley.Lotempio@secretresearch.tld	\N	2
1744	Warona Pelligrino	Warona.Pelligrino@secretresearch.tld	\N	2
1382	Thanaa Bustos	Thanaa.Bustos@secretresearch.tld	\N	2
2449	Mabel Gaito	Mabel.Gaito@secretresearch.tld	\N	2
2051	Liebtraud Schorsch	Liebtraud.Schorsch@secretresearch.tld	\N	2
1056	Adelaide Certosimo	Adelaide.Certosimo@secretresearch.tld	\N	2
731	Enar Nordlinger	Enar.Nordlinger@secretresearch.tld	\N	2
1101	Taliyah Jafari	Taliyah.Jafari@secretresearch.tld	\N	2
333	Haruhiko Tindell	Haruhiko.Tindell@secretresearch.tld	\N	2
1773	Teodoro Coyt	Teodoro.Coyt@secretresearch.tld	\N	2
1242	Wouter Mowbray	Wouter.Mowbray@secretresearch.tld	\N	2
355	Vashan Flener	Vashan.Flener@secretresearch.tld	\N	2
1009	Lillian Rehbein	Lillian.Rehbein@secretresearch.tld	\N	2
1517	Addi Rinks	Addi.Rinks@secretresearch.tld	\N	2
1739	Sasson Kniffin	Sasson.Kniffin@secretresearch.tld	\N	2
1300	Lilja Siwiec	Lilja.Siwiec@secretresearch.tld	\N	2
937	Isotta Holsey	Isotta.Holsey@secretresearch.tld	\N	2
435	Inez Meeroff	Inez.Meeroff@secretresearch.tld	\N	2
1143	Masazumi Chuta	Masazumi.Chuta@secretresearch.tld	\N	2
826	Kywrkh Tomaino	Kywrkh.Tomaino@secretresearch.tld	\N	2
1045	Cant Kammerzell	Cant.Kammerzell@secretresearch.tld	\N	2
482	Kent Taurino	Kent.Taurino@secretresearch.tld	\N	2
260	Aldona Sichel	Aldona.Sichel@secretresearch.tld	\N	2
514	Hamsa Hielscher	Hamsa.Hielscher@secretresearch.tld	\N	2
281	Goring Francour	Goring.Francour@secretresearch.tld	\N	2
1061	Carinna Bridget	Carinna.Bridget@secretresearch.tld	\N	2
342	Analeigh Sebring	Analeigh.Sebring@secretresearch.tld	\N	2
1414	Che Kess	Che.Kess@secretresearch.tld	\N	2
1561	Latasha Warens	Latasha.Warens@secretresearch.tld	\N	2
366	Manu Geyman	Manu.Geyman@secretresearch.tld	\N	2
2117	Padma Ramaker	Padma.Ramaker@secretresearch.tld	\N	2
909	Umaima Mcandrews	Umaima.Mcandrews@secretresearch.tld	\N	2
2300	Hortense Ganotisi	Hortense.Ganotisi@secretresearch.tld	\N	2
347	Junichi Hagele	Junichi.Hagele@secretresearch.tld	\N	2
96	Amir Conkling	Amir.Conkling@secretresearch.tld	\N	2
1355	Eber Ebinger	Eber.Ebinger@secretresearch.tld	\N	2
2926	Namiko Leval	Namiko.Leval@secretresearch.tld	\N	2
663	Fahroni Anglea	Fahroni.Anglea@secretresearch.tld	\N	2
1496	Abhigna Furman	Abhigna.Furman@secretresearch.tld	\N	2
2428	Elwira Gasper	Elwira.Gasper@secretresearch.tld	\N	2
2189	Dukinea Zmijewski	Dukinea.Zmijewski@secretresearch.tld	\N	2
2973	Finn Carboneau	Finn.Carboneau@secretresearch.tld	\N	2
2607	Lisil Hellmuth	Lisil.Hellmuth@secretresearch.tld	\N	2
706	Vilena Orillion	Vilena.Orillion@secretresearch.tld	\N	2
1359	Dwight Brauman	Dwight.Brauman@secretresearch.tld	\N	2
273	Yoyon Lecroy	Yoyon.Lecroy@secretresearch.tld	\N	2
1594	Takehide Gauna	Takehide.Gauna@secretresearch.tld	\N	2
1528	Raimundo Wetklow	Raimundo.Wetklow@secretresearch.tld	\N	2
2152	Lisandro Harpst	Lisandro.Harpst@secretresearch.tld	\N	2
2490	Keyna Maisonet	Keyna.Maisonet@secretresearch.tld	\N	2
1793	Anandita Hymer	Anandita.Hymer@secretresearch.tld	\N	2
226	PavIpv Howick	PavIpv.Howick@secretresearch.tld	\N	2
384	Evdxios Fageraes	Evdxios.Fageraes@secretresearch.tld	\N	2
1020	Jelawat Balletta	Jelawat.Balletta@secretresearch.tld	\N	2
1021	Kuemon Coatie	Kuemon.Coatie@secretresearch.tld	\N	2
457	Leonel Meche	Leonel.Meche@secretresearch.tld	\N	2
816	Prospero Waner	Prospero.Waner@secretresearch.tld	\N	2
1502	Ison Wojtanowski	Ison.Wojtanowski@secretresearch.tld	\N	2
2072	Thomasa Vasconcelos	Thomasa.Vasconcelos@secretresearch.tld	\N	2
1332	Jedrick Relacion	Jedrick.Relacion@secretresearch.tld	\N	2
1458	Gregos Beltrain	Gregos.Beltrain@secretresearch.tld	\N	2
407	Carevel Tardif	Carevel.Tardif@secretresearch.tld	\N	2
91	Gebert Kercher	Gebert.Kercher@secretresearch.tld	\N	2
2721	Mazcho Stringer	Mazcho.Stringer@secretresearch.tld	\N	2
800	Bodgana Senne	Bodgana.Senne@secretresearch.tld	\N	2
2756	Satomi Lampitt	Satomi.Lampitt@secretresearch.tld	\N	2
2528	Blossom Quero	Blossom.Quero@secretresearch.tld	\N	2
189	Mitsuo Neff	Mitsuo.Neff@secretresearch.tld	\N	2
1637	Sela Funnye	Sela.Funnye@secretresearch.tld	\N	2
1596	Elzbeta Mieloszyk	Elzbeta.Mieloszyk@secretresearch.tld	\N	2
882	Gerty Tokich	Gerty.Tokich@secretresearch.tld	\N	2
917	Radha Sloan	Radha.Sloan@secretresearch.tld	\N	2
1526	Abdul Spicer	Abdul.Spicer@secretresearch.tld	\N	2
2198	Traviata Tewksbury	Traviata.Tewksbury@secretresearch.tld	\N	2
2135	Maxime Higgs	Maxime.Higgs@secretresearch.tld	\N	2
1868	Sozui Jalovel	Sozui.Jalovel@secretresearch.tld	\N	2
907	Dora Brisbone	Dora.Brisbone@secretresearch.tld	\N	2
48	Dmitreeva Ellsbury	Dmitreeva.Ellsbury@secretresearch.tld	\N	2
838	Ulia Kaines	Ulia.Kaines@secretresearch.tld	\N	2
2783	Camika Montilla	Camika.Montilla@secretresearch.tld	\N	2
733	Madelynn Hoehn	Madelynn.Hoehn@secretresearch.tld	\N	2
1562	Saeko Rachar	Saeko.Rachar@secretresearch.tld	\N	2
2235	Anka Pindell	Anka.Pindell@secretresearch.tld	\N	2
2623	Valerik Peles	Valerik.Peles@secretresearch.tld	\N	2
353	Talicia Korsen	Talicia.Korsen@secretresearch.tld	\N	2
1996	Sameera Beazley	Sameera.Beazley@secretresearch.tld	\N	2
1267	Boje Ostrum	Boje.Ostrum@secretresearch.tld	\N	2
1255	Rocky Brierre	Rocky.Brierre@secretresearch.tld	\N	2
775	Nazarova Abundis	Nazarova.Abundis@secretresearch.tld	\N	2
0	Avigdor Puglia	Avigdor.Puglia@secretresearch.tld	\N	2
2426	Apelino Reeber	Apelino.Reeber@secretresearch.tld	\N	2
535	Juthe Bentson	Juthe.Bentson@secretresearch.tld	\N	2
915	Addison Bovio	Addison.Bovio@secretresearch.tld	\N	2
2016	Hagibis Kihn	Hagibis.Kihn@secretresearch.tld	\N	2
572	Sebastiano Lockyer	Sebastiano.Lockyer@secretresearch.tld	\N	2
352	Uliana Fanning	Uliana.Fanning@secretresearch.tld	\N	2
2212	Ajanta Mischel	Ajanta.Mischel@secretresearch.tld	\N	2
1734	Gengyo Cumbass	Gengyo.Cumbass@secretresearch.tld	\N	2
2050	Majdiyya Bonsall	Majdiyya.Bonsall@secretresearch.tld	\N	2
1307	Daris Astley	Daris.Astley@secretresearch.tld	\N	2
1565	Earlena Heimlicher	Earlena.Heimlicher@secretresearch.tld	\N	2
2566	Raina Hermandez	Raina.Hermandez@secretresearch.tld	\N	2
2473	Zdeslava Barkus	Zdeslava.Barkus@secretresearch.tld	\N	2
1158	Ewiniar Mouret	Ewiniar.Mouret@secretresearch.tld	\N	2
801	Roxanne Vandezande	Roxanne.Vandezande@secretresearch.tld	\N	2
2264	Maiya Viars	Maiya.Viars@secretresearch.tld	\N	2
1642	Vasilista Hamic	Vasilista.Hamic@secretresearch.tld	\N	2
3012	Mutammam Bowersox	Mutammam.Bowersox@secretresearch.tld	\N	2
2735	Hedda Yoshida	Hedda.Yoshida@secretresearch.tld	\N	2
357	Denes Wahlert	Denes.Wahlert@secretresearch.tld	\N	2
2513	Matashichi Butman	Matashichi.Butman@secretresearch.tld	\N	2
2104	Anandamayi Clerf	Anandamayi.Clerf@secretresearch.tld	\N	2
2495	Roland Kegler	Roland.Kegler@secretresearch.tld	\N	2
661	Edmondo Rommelfanger	Edmondo.Rommelfanger@secretresearch.tld	\N	2
1688	Kaspar Reierson	Kaspar.Reierson@secretresearch.tld	\N	2
2556	AbdulQuddoos Mccallie	AbdulQuddoos.Mccallie@secretresearch.tld	\N	2
1366	Rashan Huyard	Rashan.Huyard@secretresearch.tld	\N	2
2737	Giovanna Douthit	Giovanna.Douthit@secretresearch.tld	\N	2
2871	Judyta Solymani	Judyta.Solymani@secretresearch.tld	\N	2
1076	Hilario Kovats	Hilario.Kovats@secretresearch.tld	\N	2
2603	Fokina Poythress	Fokina.Poythress@secretresearch.tld	\N	2
1064	Oscar Formica	Oscar.Formica@secretresearch.tld	\N	2
2164	Trish Kurnik	Trish.Kurnik@secretresearch.tld	\N	2
1519	Matteo Mestre	Matteo.Mestre@secretresearch.tld	\N	2
2921	Charmaine Rubick	Charmaine.Rubick@secretresearch.tld	\N	2
1879	Imre Muellner	Imre.Muellner@secretresearch.tld	\N	2
2689	Iha Em	Iha.Em@secretresearch.tld	\N	2
1797	Sumie Stamdifer	Sumie.Stamdifer@secretresearch.tld	\N	2
2119	Ghana Reppucci	Ghana.Reppucci@secretresearch.tld	\N	2
2161	Akinari Muston	Akinari.Muston@secretresearch.tld	\N	2
941	Clarice Tillberg	Clarice.Tillberg@secretresearch.tld	\N	2
567	Kara Shuttlesworth	Kara.Shuttlesworth@secretresearch.tld	\N	2
2476	Tandu Miltenberger	Tandu.Miltenberger@secretresearch.tld	\N	2
1102	Donald Ludlow	Donald.Ludlow@secretresearch.tld	\N	2
2846	Davida Rho	Davida.Rho@secretresearch.tld	\N	2
856	Emina Yeeloy	Emina.Yeeloy@secretresearch.tld	\N	2
1911	Arno Barquera	Arno.Barquera@secretresearch.tld	\N	2
1914	Tishka Zale	Tishka.Zale@secretresearch.tld	\N	2
766	Sonechka Matye	Sonechka.Matye@secretresearch.tld	\N	2
859	Lotta Francoise	Lotta.Francoise@secretresearch.tld	\N	2
2750	Karlene Bilello	Karlene.Bilello@secretresearch.tld	\N	2
1987	Eliazar Manner	Eliazar.Manner@secretresearch.tld	\N	2
2200	Astrios Purrington	Astrios.Purrington@secretresearch.tld	\N	2
721	Aida Appelt	Aida.Appelt@secretresearch.tld	\N	2
209	Clarine Waynick	Clarine.Waynick@secretresearch.tld	\N	2
1807	Deniz Medler	Deniz.Medler@secretresearch.tld	\N	2
2483	Ilyaas Hipsley	Ilyaas.Hipsley@secretresearch.tld	\N	2
2399	Sofeia Schmick	Sofeia.Schmick@secretresearch.tld	\N	2
1873	Dardanus Dobosh	Dardanus.Dobosh@secretresearch.tld	\N	2
3043	Aberthol Wilczak	Aberthol.Wilczak@secretresearch.tld	\N	2
2571	Xuqiu Deller	Xuqiu.Deller@secretresearch.tld	\N	2
2739	Hariti Yerdon	Hariti.Yerdon@secretresearch.tld	\N	2
359	Lauranne Brwon	Lauranne.Brwon@secretresearch.tld	\N	2
756	Muni Mccuiston	Muni.Mccuiston@secretresearch.tld	\N	2
2706	Raaid Chrispen	Raaid.Chrispen@secretresearch.tld	\N	2
2998	Gerion Sonoski	Gerion.Sonoski@secretresearch.tld	\N	2
644	Livia Colosimo	Livia.Colosimo@secretresearch.tld	\N	2
443	Naazil Buchannan	Naazil.Buchannan@secretresearch.tld	\N	2
2012	Bhavin Primavera	Bhavin.Primavera@secretresearch.tld	\N	2
2960	Shiko Seagroves	Shiko.Seagroves@secretresearch.tld	\N	2
2144	Ethelgard Karpinsky	Ethelgard.Karpinsky@secretresearch.tld	\N	2
2525	Bodil Korinta	Bodil.Korinta@secretresearch.tld	\N	2
1611	Vychan Stotz	Vychan.Stotz@secretresearch.tld	\N	2
2219	Yukako Klingbeil	Yukako.Klingbeil@secretresearch.tld	\N	2
2006	Katreen Osthoff	Katreen.Osthoff@secretresearch.tld	\N	2
884	Benito Tam	Benito.Tam@secretresearch.tld	\N	2
747	Korotsek Baltzell	Korotsek.Baltzell@secretresearch.tld	\N	2
1991	Kantha Lybert	Kantha.Lybert@secretresearch.tld	\N	2
2328	Coby Smaller	Coby.Smaller@secretresearch.tld	\N	2
1087	Oryan Mirles	Oryan.Mirles@secretresearch.tld	\N	2
112	Vladlena Tlumacki	Vladlena.Tlumacki@secretresearch.tld	\N	2
673	Jazmine Susman	Jazmine.Susman@secretresearch.tld	\N	2
1018	Lasil Legum	Lasil.Legum@secretresearch.tld	\N	2
836	Argus Bierwirth	Argus.Bierwirth@secretresearch.tld	\N	2
1465	Nathanael Better	Nathanael.Better@secretresearch.tld	\N	2
935	Callista Bernstrom	Callista.Bernstrom@secretresearch.tld	\N	2
713	Stacie Ciesielski	Stacie.Ciesielski@secretresearch.tld	\N	2
1439	Juri Guzik	Juri.Guzik@secretresearch.tld	\N	2
1069	Mercede Naslund	Mercede.Naslund@secretresearch.tld	\N	2
2589	Vasileva Rugg	Vasileva.Rugg@secretresearch.tld	\N	2
734	Auring Phanord	Auring.Phanord@secretresearch.tld	\N	2
1948	Juriaan Schremp	Juriaan.Schremp@secretresearch.tld	\N	2
1323	Liviana Rickon	Liviana.Rickon@secretresearch.tld	\N	2
551	Shadhaa Gomillion	Shadhaa.Gomillion@secretresearch.tld	\N	2
1765	Calida Starace	Calida.Starace@secretresearch.tld	\N	2
118	AnnCathrin Axel	AnnCathrin.Axel@secretresearch.tld	\N	2
1378	JamAan Kine	JamAan.Kine@secretresearch.tld	\N	2
2763	Tsutomu Atzinger	Tsutomu.Atzinger@secretresearch.tld	\N	2
2782	Ovidio Bostrom	Ovidio.Bostrom@secretresearch.tld	\N	2
1493	Tiun Hussien	Tiun.Hussien@secretresearch.tld	\N	2
627	Hellmut Tousant	Hellmut.Tousant@secretresearch.tld	\N	2
1758	Javier Hausauer	Javier.Hausauer@secretresearch.tld	\N	2
1852	Jelisaweta Ambroziak	Jelisaweta.Ambroziak@secretresearch.tld	\N	2
93	Naadiya Maslyn	Naadiya.Maslyn@secretresearch.tld	\N	2
2619	Ilsegret Akerley	Ilsegret.Akerley@secretresearch.tld	\N	2
1218	Hita Porell	Hita.Porell@secretresearch.tld	\N	2
1403	Carson Skagen	Carson.Skagen@secretresearch.tld	\N	2
2256	Hareem Rollo	Hareem.Rollo@secretresearch.tld	\N	2
620	Natasia Sliter	Natasia.Sliter@secretresearch.tld	\N	2
1745	Maysak Anetsberger	Maysak.Anetsberger@secretresearch.tld	\N	2
257	Rintaro Axson	Rintaro.Axson@secretresearch.tld	\N	2
213	Cursetta Isa	Cursetta.Isa@secretresearch.tld	\N	2
147	Afyia Gines	Afyia.Gines@secretresearch.tld	\N	2
2107	Izazkun Suleski	Izazkun.Suleski@secretresearch.tld	\N	2
1971	Wolfhelm Abella	Wolfhelm.Abella@secretresearch.tld	\N	2
2418	Suphachad Tham	Suphachad.Tham@secretresearch.tld	\N	2
2729	Ernst Bengtson	Ernst.Bengtson@secretresearch.tld	\N	2
1888	Nomi Rosato	Nomi.Rosato@secretresearch.tld	\N	2
1648	Irminwin Milloy	Irminwin.Milloy@secretresearch.tld	\N	2
1748	Satoru Beaumont	Satoru.Beaumont@secretresearch.tld	\N	2
561	Sadayoshi Englemann	Sadayoshi.Englemann@secretresearch.tld	\N	2
1446	Faith Neeld	Faith.Neeld@secretresearch.tld	\N	2
205	Melvina Grant	Melvina.Grant@secretresearch.tld	\N	2
212	Josianne Gopen	Josianne.Gopen@secretresearch.tld	\N	2
1244	Teriuihi Lachner	Teriuihi.Lachner@secretresearch.tld	\N	2
1052	Susan Altidor	Susan.Altidor@secretresearch.tld	\N	2
2302	Razan Symons	Razan.Symons@secretresearch.tld	\N	2
1918	Mesha Kornrumpf	Mesha.Kornrumpf@secretresearch.tld	\N	2
2345	Triesha Carland	Triesha.Carland@secretresearch.tld	\N	2
719	Sigurd Mahli	Sigurd.Mahli@secretresearch.tld	\N	2
2118	Fulko Pullen	Fulko.Pullen@secretresearch.tld	\N	2
2096	Evamarie Coraham	Evamarie.Coraham@secretresearch.tld	\N	2
589	Meena Riegel	Meena.Riegel@secretresearch.tld	\N	2
476	Adela Westcote	Adela.Westcote@secretresearch.tld	\N	2
1054	Iarogned Trivette	Iarogned.Trivette@secretresearch.tld	\N	2
57	Hasnaa Sietsema	Hasnaa.Sietsema@secretresearch.tld	\N	2
1112	Shaakira Ricklefs	Shaakira.Ricklefs@secretresearch.tld	\N	2
571	Masakazu Lisko	Masakazu.Lisko@secretresearch.tld	\N	2
2679	Alyss Wuitschick	Alyss.Wuitschick@secretresearch.tld	\N	2
1658	Alessandra Kellar	Alessandra.Kellar@secretresearch.tld	\N	2
2244	Basheer Hatcher	Basheer.Hatcher@secretresearch.tld	\N	2
791	Zenalisa Delisle	Zenalisa.Delisle@secretresearch.tld	\N	2
387	Laurena Rednour	Laurena.Rednour@secretresearch.tld	\N	2
1343	Bezubaia Wiece	Bezubaia.Wiece@secretresearch.tld	\N	2
2431	Saer Dillenbeck	Saer.Dillenbeck@secretresearch.tld	\N	2
2032	Janne Efurd	Janne.Efurd@secretresearch.tld	\N	2
101	Oles Sumaran	Oles.Sumaran@secretresearch.tld	\N	2
1339	Mamelfa Learned	Mamelfa.Learned@secretresearch.tld	\N	2
1293	Greg Weatherly	Greg.Weatherly@secretresearch.tld	\N	2
697	Dhaki Etchinson	Dhaki.Etchinson@secretresearch.tld	\N	2
1223	Raimund Widdowson	Raimund.Widdowson@secretresearch.tld	\N	2
1084	Guido Genier	Guido.Genier@secretresearch.tld	\N	2
464	Loris Elder	Loris.Elder@secretresearch.tld	\N	2
951	Aintzane Lurry	Aintzane.Lurry@secretresearch.tld	\N	2
427	Mamika Blakstad	Mamika.Blakstad@secretresearch.tld	\N	2
1068	Eldon Ulatowski	Eldon.Ulatowski@secretresearch.tld	\N	2
157	Mayumi Vaneaton	Mayumi.Vaneaton@secretresearch.tld	\N	2
1136	Peadair Lann	Peadair.Lann@secretresearch.tld	\N	2
2145	Edda Fenchel	Edda.Fenchel@secretresearch.tld	\N	2
45	Maureo Benedict	Maureo.Benedict@secretresearch.tld	\N	2
1348	Pasha Bevilaqua	Pasha.Bevilaqua@secretresearch.tld	\N	2
440	Katyushka Gabriele	Katyushka.Gabriele@secretresearch.tld	\N	2
295	Brandy Beaudoin	Brandy.Beaudoin@secretresearch.tld	\N	2
1904	Anchita Figlar	Anchita.Figlar@secretresearch.tld	\N	2
1322	Galla Arnzen	Galla.Arnzen@secretresearch.tld	\N	2
294	Takuma Moncur	Takuma.Moncur@secretresearch.tld	\N	2
2004	Danaus Dacanay	Danaus.Dacanay@secretresearch.tld	\N	2
2063	Hilary Braddy	Hilary.Braddy@secretresearch.tld	\N	2
883	Lucero Companie	Lucero.Companie@secretresearch.tld	\N	2
2076	Gyorgy Clancy	Gyorgy.Clancy@secretresearch.tld	\N	2
1048	Yachne Piersall	Yachne.Piersall@secretresearch.tld	\N	2
2612	lkisti Dayne	lkisti.Dayne@secretresearch.tld	\N	2
1520	Amalia Krajcik	Amalia.Krajcik@secretresearch.tld	\N	2
1053	Rosa Navor	Rosa.Navor@secretresearch.tld	\N	2
328	Koko Borgstrom	Koko.Borgstrom@secretresearch.tld	\N	2
645	Bahar Banter	Bahar.Banter@secretresearch.tld	\N	2
1681	Bowen Antunez	Bowen.Antunez@secretresearch.tld	\N	2
128	Erichthonius Grulkey	Erichthonius.Grulkey@secretresearch.tld	\N	2
839	Clarinda Oberg	Clarinda.Oberg@secretresearch.tld	\N	2
1429	Tamiko Docken	Tamiko.Docken@secretresearch.tld	\N	2
743	Helene Nik	Helene.Nik@secretresearch.tld	\N	2
1376	Dores Hugi	Dores.Hugi@secretresearch.tld	\N	2
1475	Kim Colombe	Kim.Colombe@secretresearch.tld	\N	2
1593	Melisa Patriarco	Melisa.Patriarco@secretresearch.tld	\N	2
141	Flora Aveni	Flora.Aveni@secretresearch.tld	\N	2
784	Tramaine Scruton	Tramaine.Scruton@secretresearch.tld	\N	2
2066	Juanisha Seppi	Juanisha.Seppi@secretresearch.tld	\N	2
2655	Wasmaaa Roen	Wasmaaa.Roen@secretresearch.tld	\N	2
2669	Heidelore Ruschmann	Heidelore.Ruschmann@secretresearch.tld	\N	2
2638	Silvester Yelvington	Silvester.Yelvington@secretresearch.tld	\N	2
1060	Ludolfina Hinley	Ludolfina.Hinley@secretresearch.tld	\N	2
1266	Adrien Hoit	Adrien.Hoit@secretresearch.tld	\N	2
585	Takako Nordine	Takako.Nordine@secretresearch.tld	\N	2
214	Ashlie Barnak	Ashlie.Barnak@secretresearch.tld	\N	2
1905	Tino Mendonsa	Tino.Mendonsa@secretresearch.tld	\N	2
1364	Raisa Kollar	Raisa.Kollar@secretresearch.tld	\N	2
1049	Kache Reissig	Kache.Reissig@secretresearch.tld	\N	2
702	Chesell Vatter	Chesell.Vatter@secretresearch.tld	\N	2
39	Nolan Brownle	Nolan.Brownle@secretresearch.tld	\N	2
1550	Angha Bievenue	Angha.Bievenue@secretresearch.tld	\N	2
813	Dorsey Mccarroll	Dorsey.Mccarroll@secretresearch.tld	\N	2
29	Edmonda Ditullio	Edmonda.Ditullio@secretresearch.tld	\N	2
1895	Saionji Pierrot	Saionji.Pierrot@secretresearch.tld	\N	2
2425	Benton Bertuzzi	Benton.Bertuzzi@secretresearch.tld	\N	2
1472	Iulia Morra	Iulia.Morra@secretresearch.tld	\N	2
2753	Clmentine Engellant	Clmentine.Engellant@secretresearch.tld	\N	2
2408	Hortensia Rothbart	Hortensia.Rothbart@secretresearch.tld	\N	2
715	Cecily Pazik	Cecily.Pazik@secretresearch.tld	\N	2
2205	Marcelino Bulat	Marcelino.Bulat@secretresearch.tld	\N	2
835	Adwr Liiv	Adwr.Liiv@secretresearch.tld	\N	2
1666	Benignus Diec	Benignus.Diec@secretresearch.tld	\N	2
1226	Kai Hamara	Kai.Hamara@secretresearch.tld	\N	2
866	Gisselle Teigen	Gisselle.Teigen@secretresearch.tld	\N	2
1411	Lucretia Ferndez	Lucretia.Ferndez@secretresearch.tld	\N	2
153	Lovell Nenni	Lovell.Nenni@secretresearch.tld	\N	2
1767	Imelde Ballin	Imelde.Ballin@secretresearch.tld	\N	2
675	Latoya Lovato	Latoya.Lovato@secretresearch.tld	\N	2
2330	Koshiro Augusto	Koshiro.Augusto@secretresearch.tld	\N	2
92	Takuji Gangluff	Takuji.Gangluff@secretresearch.tld	\N	2
237	Perpetua Leyva	Perpetua.Leyva@secretresearch.tld	\N	2
2	Sudehna Sotomayor	Sudehna.Sotomayor@secretresearch.tld	\N	2
1413	Aonghas Pashley	Aonghas.Pashley@secretresearch.tld	\N	2
477	Dietmute Lunn	Dietmute.Lunn@secretresearch.tld	\N	2
2142	Svetlana Befort	Svetlana.Befort@secretresearch.tld	\N	2
1235	Marcus Neubert	Marcus.Neubert@secretresearch.tld	\N	2
2159	Iken Siluis	Iken.Siluis@secretresearch.tld	\N	2
1196	Ineng Alkbsh	Ineng.Alkbsh@secretresearch.tld	\N	2
50	Jamaall Rohen	Jamaall.Rohen@secretresearch.tld	\N	2
746	Ricky Wyss	Ricky.Wyss@secretresearch.tld	\N	2
2398	Devontae Abaloz	Devontae.Abaloz@secretresearch.tld	\N	2
1047	Amadom Badoni	Amadom.Badoni@secretresearch.tld	\N	2
1634	Lloyd Stallsmith	Lloyd.Stallsmith@secretresearch.tld	\N	2
1305	Luithilde Brandolino	Luithilde.Brandolino@secretresearch.tld	\N	2
171	Mitsu Kerbs	Mitsu.Kerbs@secretresearch.tld	\N	2
262	Vasin Marallo	Vasin.Marallo@secretresearch.tld	\N	2
817	Angelica Maccarter	Angelica.Maccarter@secretresearch.tld	\N	2
1420	Pukhleriia Fawson	Pukhleriia.Fawson@secretresearch.tld	\N	2
757	Jamuna Orts	Jamuna.Orts@secretresearch.tld	\N	2
1410	Bussho Oda	Bussho.Oda@secretresearch.tld	\N	2
315	Alissa Woodridge	Alissa.Woodridge@secretresearch.tld	\N	2
723	Tekla Gallerani	Tekla.Gallerani@secretresearch.tld	\N	2
1939	Cadman Strom	Cadman.Strom@secretresearch.tld	\N	2
778	Michizane Krips	Michizane.Krips@secretresearch.tld	\N	2
320	Alika Odgen	Alika.Odgen@secretresearch.tld	\N	2
2662	Phineas Schubach	Phineas.Schubach@secretresearch.tld	\N	2
306	Diomedes Raisley	Diomedes.Raisley@secretresearch.tld	\N	2
942	Eufemia Hensen	Eufemia.Hensen@secretresearch.tld	\N	2
1570	Ingemar Cheevers	Ingemar.Cheevers@secretresearch.tld	\N	2
891	Mita Schwering	Mita.Schwering@secretresearch.tld	\N	2
429	Cenon Colon	Cenon.Colon@secretresearch.tld	\N	2
2204	Wayan Whitelow	Wayan.Whitelow@secretresearch.tld	\N	2
1282	Herberta Fullenwider	Herberta.Fullenwider@secretresearch.tld	\N	2
311	Marion Verdi	Marion.Verdi@secretresearch.tld	\N	2
1968	Bhoomika Secord	Bhoomika.Secord@secretresearch.tld	\N	2
90	Doug Fedak	Doug.Fedak@secretresearch.tld	\N	2
31	Zarek Laasaga	Zarek.Laasaga@secretresearch.tld	\N	2
1156	Haleigh Rodell	Haleigh.Rodell@secretresearch.tld	\N	2
1993	Cassian Cozzy	Cassian.Cozzy@secretresearch.tld	\N	2
1418	Rosamar Wish	Rosamar.Wish@secretresearch.tld	\N	2
632	Llyn Hardge	Llyn.Hardge@secretresearch.tld	\N	2
119	Amos Mackay	Amos.Mackay@secretresearch.tld	\N	2
365	Taunya Staller	Taunya.Staller@secretresearch.tld	\N	2
304	Gyes Pandy	Gyes.Pandy@secretresearch.tld	\N	2
519	Tokimune Davanzo	Tokimune.Davanzo@secretresearch.tld	\N	2
1380	Gia Stonesifer	Gia.Stonesifer@secretresearch.tld	\N	2
577	Mstislava Touby	Mstislava.Touby@secretresearch.tld	\N	2
1315	Tiyah Iha	Tiyah.Iha@secretresearch.tld	\N	2
371	Jonam Steinle	Jonam.Steinle@secretresearch.tld	\N	2
1726	Enya Coll	Enya.Coll@secretresearch.tld	\N	2
1089	Brenda Varley	Brenda.Varley@secretresearch.tld	\N	2
495	Shantese Toyota	Shantese.Toyota@secretresearch.tld	\N	2
727	Cleveland Navarez	Cleveland.Navarez@secretresearch.tld	\N	2
1108	Shahaama Berum	Shahaama.Berum@secretresearch.tld	\N	2
1057	Kaleb Eovaldi	Kaleb.Eovaldi@secretresearch.tld	\N	2
1351	Everardo Yidiaris	Everardo.Yidiaris@secretresearch.tld	\N	2
1485	Atsumori Bloyer	Atsumori.Bloyer@secretresearch.tld	\N	2
2158	Susanne Fenster	Susanne.Fenster@secretresearch.tld	\N	2
541	Sanya Parma	Sanya.Parma@secretresearch.tld	\N	2
2282	Sharise Heagy	Sharise.Heagy@secretresearch.tld	\N	2
1705	Cellina Schlosser	Cellina.Schlosser@secretresearch.tld	\N	2
1125	Fedoritsa Stinner	Fedoritsa.Stinner@secretresearch.tld	\N	2
919	Cicely Genna	Cicely.Genna@secretresearch.tld	\N	2
2251	Gottfried Lanzoni	Gottfried.Lanzoni@secretresearch.tld	\N	2
1553	Krystyn Slutsky	Krystyn.Slutsky@secretresearch.tld	\N	2
1952	Grite Faddis	Grite.Faddis@secretresearch.tld	\N	2
1003	Rosalinde Leinbach	Rosalinde.Leinbach@secretresearch.tld	\N	2
1813	Maksimina Pecinousky	Maksimina.Pecinousky@secretresearch.tld	\N	2
1269	Ladinka Ehiginator	Ladinka.Ehiginator@secretresearch.tld	\N	2
409	Francesco Spelts	Francesco.Spelts@secretresearch.tld	\N	2
529	Elan Malloch	Elan.Malloch@secretresearch.tld	\N	2
1219	Agdta Moccasin	Agdta.Moccasin@secretresearch.tld	\N	2
557	Solange Alson	Solange.Alson@secretresearch.tld	\N	2
63	Makhna Stabile	Makhna.Stabile@secretresearch.tld	\N	2
1029	Tor Fieldman	Tor.Fieldman@secretresearch.tld	\N	2
1059	Tkelah Houghtling	Tkelah.Houghtling@secretresearch.tld	\N	2
1753	Muna Lastovica	Muna.Lastovica@secretresearch.tld	\N	2
688	Fame Clarey	Fame.Clarey@secretresearch.tld	\N	2
338	Cipriana Wadzinski	Cipriana.Wadzinski@secretresearch.tld	\N	2
271	Paloma Schnall	Paloma.Schnall@secretresearch.tld	\N	2
1209	Charlette Negron	Charlette.Negron@secretresearch.tld	\N	2
434	Layla Garnow	Layla.Garnow@secretresearch.tld	\N	2
2831	Gavriella Sasson	Gavriella.Sasson@secretresearch.tld	\N	2
967	Zambda Cusson	Zambda.Cusson@secretresearch.tld	\N	2
84	Ashakiran Bingley	Ashakiran.Bingley@secretresearch.tld	\N	2
326	Strezislava Weingard	Strezislava.Weingard@secretresearch.tld	\N	2
666	Pechta Ok	Pechta.Ok@secretresearch.tld	\N	2
203	Katlina Furth	Katlina.Furth@secretresearch.tld	\N	2
2404	Elysia Nangle	Elysia.Nangle@secretresearch.tld	\N	2
1370	Lucile Homola	Lucile.Homola@secretresearch.tld	\N	2
1405	Guiseppa Thurstonson	Guiseppa.Thurstonson@secretresearch.tld	\N	2
1274	Solymar Palisbo	Solymar.Palisbo@secretresearch.tld	\N	2
1398	Yoriko Boot	Yoriko.Boot@secretresearch.tld	\N	2
681	Dewayne Buttermore	Dewayne.Buttermore@secretresearch.tld	\N	2
42	Shontaya Klitzner	Shontaya.Klitzner@secretresearch.tld	\N	2
1188	Sophronia Peakes	Sophronia.Peakes@secretresearch.tld	\N	2
863	Astamata Micthell	Astamata.Micthell@secretresearch.tld	\N	2
1702	Coireall Shelor	Coireall.Shelor@secretresearch.tld	\N	2
980	Leanna Marxen	Leanna.Marxen@secretresearch.tld	\N	2
1557	Burkhard Hussein	Burkhard.Hussein@secretresearch.tld	\N	2
261	Zaghlool Bigwood	Zaghlool.Bigwood@secretresearch.tld	\N	2
286	Nicolette Holle	Nicolette.Holle@secretresearch.tld	\N	2
69	Rita Savery	Rita.Savery@secretresearch.tld	\N	2
2382	Branislava Marentis	Branislava.Marentis@secretresearch.tld	\N	2
2060	Rakhiel Verkler	Rakhiel.Verkler@secretresearch.tld	\N	2
1530	Goliat Telesco	Goliat.Telesco@secretresearch.tld	\N	2
1126	Eryi Deppe	Eryi.Deppe@secretresearch.tld	\N	2
759	NewyddIlyn Borchers	NewyddIlyn.Borchers@secretresearch.tld	\N	2
325	Elodie Hershelman	Elodie.Hershelman@secretresearch.tld	\N	2
1768	Brasidas Hanauer	Brasidas.Hanauer@secretresearch.tld	\N	2
1334	Francoise Rioux	Francoise.Rioux@secretresearch.tld	\N	2
898	Tiege Brdar	Tiege.Brdar@secretresearch.tld	\N	2
2055	Florica Belski	Florica.Belski@secretresearch.tld	\N	2
1417	Ora Poleyestewa	Ora.Poleyestewa@secretresearch.tld	\N	2
1317	Xiomara Plowe	Xiomara.Plowe@secretresearch.tld	\N	2
110	Adriaan Belter	Adriaan.Belter@secretresearch.tld	\N	2
245	Tracy Dupay	Tracy.Dupay@secretresearch.tld	\N	2
2453	Nadheera Maricich	Nadheera.Maricich@secretresearch.tld	\N	2
664	Korechika Mamer	Korechika.Mamer@secretresearch.tld	\N	2
689	Safiyya Letchaw	Safiyya.Letchaw@secretresearch.tld	\N	2
947	Materia Newsum	Materia.Newsum@secretresearch.tld	\N	2
2374	Stolpolcha Shigemi	Stolpolcha.Shigemi@secretresearch.tld	\N	2
1543	Tera Vigen	Tera.Vigen@secretresearch.tld	\N	2
471	Lucita Macrina	Lucita.Macrina@secretresearch.tld	\N	2
1173	Galyn Stobie	Galyn.Stobie@secretresearch.tld	\N	2
149	Rosaline Musch	Rosaline.Musch@secretresearch.tld	\N	2
388	Emiko Root	Emiko.Root@secretresearch.tld	\N	2
1078	Richika Cokeley	Richika.Cokeley@secretresearch.tld	\N	2
1249	Alonzo Sim	Alonzo.Sim@secretresearch.tld	\N	2
1145	Naasiruddeen Knotowicz	Naasiruddeen.Knotowicz@secretresearch.tld	\N	2
1466	Emely Weitzel	Emely.Weitzel@secretresearch.tld	\N	2
2279	Tringad Greenfelder	Tringad.Greenfelder@secretresearch.tld	\N	2
797	Makayla Urry	Makayla.Urry@secretresearch.tld	\N	2
1287	Irmtraut Strickland	Irmtraut.Strickland@secretresearch.tld	\N	2
113	Husain Coaxum	Husain.Coaxum@secretresearch.tld	\N	2
1171	Endora Seier	Endora.Seier@secretresearch.tld	\N	2
2167	Hisahsi Ferran	Hisahsi.Ferran@secretresearch.tld	\N	2
1928	Hesperos Schindele	Hesperos.Schindele@secretresearch.tld	\N	2
908	Pauline Fullagar	Pauline.Fullagar@secretresearch.tld	\N	2
\.



COPY "Preference" ("ID") FROM stdin;
\.



COPY "ProgramCommittee" ("ID", label) FROM stdin;
448	SIGXYZ 2014 Program Committee
873	XSWC 2015 Program Committee
2201	XSWC 2014 Program Committee
2216	YSWC 2015 Program Committee
2226	ZSWC 2015 Program Committee
2365	YSWC 2014 Program Committee
2928	ZSWC 2014 Program Committee
2933	SIGXYZ 2015 Program Committee
\.



COPY "ProgramCommitteeChair" ("ID") FROM stdin;
177
316
450
497
1073
1186
2202
2229
\.



COPY "ProgramCommitteeMember" ("ID", "maxPapers", "addedBy") FROM stdin;
497	\N	\N
177	\N	\N
537	\N	\N
682	\N	\N
121	\N	\N
958	\N	\N
875	\N	\N
1160	\N	\N
876	\N	\N
316	\N	\N
470	\N	\N
137	\N	\N
1356	\N	\N
581	\N	\N
380	\N	\N
129	\N	\N
886	\N	\N
1159	\N	\N
115	\N	\N
1581	\N	\N
1409	\N	\N
2202	\N	\N
604	\N	\N
1186	\N	\N
324	\N	\N
451	\N	\N
330	\N	\N
2423	\N	\N
725	\N	\N
874	\N	\N
2228	\N	\N
2350	\N	\N
51	\N	\N
1092	\N	\N
450	\N	\N
2229	\N	\N
819	\N	\N
449	\N	\N
597	\N	\N
169	\N	\N
2227	\N	\N
2160	\N	\N
1073	\N	\N
\.



COPY "Rejection" ("ID") FROM stdin;
\.



COPY "SubjectArea" ("ID") FROM stdin;
\.



COPY "User" ("ID", "acceptPaper", "TYPE") FROM stdin;
0	\N	0
2	\N	0
5	\N	0
13	\N	0
17	\N	0
19	\N	0
20	\N	0
21	\N	0
23	\N	0
27	\N	0
28	\N	0
29	\N	0
30	\N	0
31	\N	0
35	\N	0
36	\N	0
38	\N	0
39	\N	0
42	\N	0
45	\N	0
46	\N	0
47	\N	0
48	\N	0
50	\N	0
51	\N	0
53	\N	0
54	\N	0
57	\N	0
63	\N	0
64	\N	0
66	\N	0
67	\N	0
69	\N	0
71	\N	0
82	\N	0
83	\N	0
84	\N	0
86	\N	0
88	\N	0
90	\N	0
91	\N	0
92	\N	0
93	\N	0
96	\N	0
99	\N	0
101	\N	0
104	\N	0
107	\N	0
110	\N	0
111	\N	0
112	\N	0
113	\N	0
115	\N	0
116	\N	0
118	\N	0
119	\N	0
121	\N	0
123	\N	0
126	\N	0
128	\N	0
129	\N	0
130	\N	0
131	\N	0
135	\N	0
137	\N	0
139	\N	0
141	\N	0
143	\N	0
144	\N	0
146	\N	0
147	\N	0
149	\N	0
153	\N	0
154	\N	0
155	\N	0
157	\N	0
158	\N	0
161	\N	0
169	\N	0
171	\N	0
174	\N	0
176	\N	0
177	\N	0
179	\N	0
180	\N	0
182	\N	0
184	\N	0
186	\N	0
189	\N	0
193	\N	0
195	\N	0
196	\N	0
197	\N	0
199	\N	0
200	\N	0
201	\N	0
203	\N	0
205	\N	0
209	\N	0
212	\N	0
213	\N	0
214	\N	0
215	\N	0
217	\N	0
225	\N	0
226	\N	0
227	\N	0
228	\N	0
237	\N	0
238	\N	0
245	\N	0
248	\N	0
257	\N	0
259	\N	0
260	\N	0
261	\N	0
262	\N	0
270	\N	0
271	\N	0
272	\N	0
273	\N	0
275	\N	0
277	\N	0
279	\N	0
281	\N	0
286	\N	0
288	\N	0
289	\N	0
290	\N	0
291	\N	0
294	\N	0
295	\N	0
301	\N	0
303	\N	0
304	\N	0
305	\N	0
306	\N	0
308	\N	0
311	\N	0
315	\N	0
316	\N	0
317	\N	0
319	\N	0
320	\N	0
321	\N	0
322	\N	0
323	\N	0
324	\N	0
325	\N	0
326	\N	0
327	\N	0
328	\N	0
329	\N	0
330	\N	0
331	\N	0
332	\N	0
333	\N	0
334	\N	0
335	\N	0
336	\N	0
337	\N	0
338	\N	0
339	\N	0
340	\N	0
341	\N	0
342	\N	0
343	\N	0
344	\N	0
345	\N	0
346	\N	0
347	\N	0
348	\N	0
349	\N	0
352	\N	0
353	\N	0
355	\N	0
357	\N	0
358	\N	0
359	\N	0
365	\N	0
366	\N	0
371	\N	0
372	\N	0
380	\N	0
382	\N	0
384	\N	0
385	\N	0
387	\N	0
388	\N	0
396	\N	0
401	\N	0
403	\N	0
405	\N	0
407	\N	0
409	\N	0
412	\N	0
427	\N	0
429	\N	0
432	\N	0
433	\N	0
434	\N	0
435	\N	0
440	\N	0
442	\N	0
443	\N	0
445	\N	0
449	\N	0
450	\N	0
451	\N	0
454	\N	0
457	\N	0
458	\N	0
459	\N	0
460	\N	0
462	\N	0
464	\N	0
466	\N	0
468	\N	0
470	\N	0
471	\N	0
476	\N	0
477	\N	0
482	\N	0
488	\N	0
495	\N	0
497	\N	0
504	\N	0
514	\N	0
516	\N	0
519	\N	0
520	\N	0
524	\N	0
529	\N	0
535	\N	0
537	\N	0
541	\N	0
544	\N	0
545	\N	0
549	\N	0
551	\N	0
552	\N	0
555	\N	0
557	\N	0
558	\N	0
560	\N	0
561	\N	0
566	\N	0
567	\N	0
571	\N	0
572	\N	0
577	\N	0
581	\N	0
584	\N	0
585	\N	0
587	\N	0
589	\N	0
592	\N	0
597	\N	0
600	\N	0
604	\N	0
605	\N	0
606	\N	0
615	\N	0
620	\N	0
622	\N	0
623	\N	0
626	\N	0
627	\N	0
628	\N	0
629	\N	0
632	\N	0
633	\N	0
641	\N	0
642	\N	0
644	\N	0
645	\N	0
647	\N	0
652	\N	0
660	\N	0
661	\N	0
663	\N	0
664	\N	0
666	\N	0
673	\N	0
674	\N	0
675	\N	0
676	\N	0
681	\N	0
682	\N	0
686	\N	0
688	\N	0
689	\N	0
691	\N	0
693	\N	0
694	\N	0
697	\N	0
701	\N	0
702	\N	0
706	\N	0
710	\N	0
711	\N	0
712	\N	0
713	\N	0
715	\N	0
719	\N	0
720	\N	0
721	\N	0
723	\N	0
725	\N	0
727	\N	0
729	\N	0
731	\N	0
733	\N	0
734	\N	0
735	\N	0
738	\N	0
743	\N	0
746	\N	0
747	\N	0
749	\N	0
753	\N	0
755	\N	0
756	\N	0
757	\N	0
759	\N	0
761	\N	0
766	\N	0
767	\N	0
768	\N	0
770	\N	0
775	\N	0
777	\N	0
778	\N	0
782	\N	0
784	\N	0
785	\N	0
787	\N	0
791	\N	0
794	\N	0
797	\N	0
800	\N	0
801	\N	0
802	\N	0
808	\N	0
809	\N	0
810	\N	0
813	\N	0
816	\N	0
817	\N	0
819	\N	0
821	\N	0
822	\N	0
826	\N	0
828	\N	0
830	\N	0
833	\N	0
835	\N	0
836	\N	0
838	\N	0
839	\N	0
843	\N	0
844	\N	0
856	\N	0
858	\N	0
859	\N	0
863	\N	0
866	\N	0
874	\N	0
875	\N	0
876	\N	0
877	\N	0
881	\N	0
882	\N	0
883	\N	0
884	\N	0
886	\N	0
887	\N	0
891	\N	0
893	\N	0
895	\N	0
896	\N	0
898	\N	0
902	\N	0
907	\N	0
908	\N	0
909	\N	0
911	\N	0
915	\N	0
917	\N	0
919	\N	0
921	\N	0
923	\N	0
927	\N	0
928	\N	0
929	\N	0
935	\N	0
936	\N	0
937	\N	0
941	\N	0
942	\N	0
943	\N	0
944	\N	0
946	\N	0
947	\N	0
951	\N	0
956	\N	0
957	\N	0
958	\N	0
961	\N	0
964	\N	0
967	\N	0
971	\N	0
972	\N	0
980	\N	0
983	\N	0
986	\N	0
992	\N	0
998	\N	0
1000	\N	0
1003	\N	0
1004	\N	0
1009	\N	0
1011	\N	0
1013	\N	0
1015	\N	0
1018	\N	0
1020	\N	0
1021	\N	0
1025	\N	0
1026	\N	0
1029	\N	0
1039	\N	0
1044	\N	0
1045	\N	0
1046	\N	0
1047	\N	0
1048	\N	0
1049	\N	0
1050	\N	0
1051	\N	0
1052	\N	0
1053	\N	0
1054	\N	0
1055	\N	0
1056	\N	0
1057	\N	0
1058	\N	0
1059	\N	0
1060	\N	0
1061	\N	0
1064	\N	0
1068	\N	0
1069	\N	0
1070	\N	0
1071	\N	0
1073	\N	0
1076	\N	0
1078	\N	0
1084	\N	0
1087	\N	0
1089	\N	0
1092	\N	0
1098	\N	0
1101	\N	0
1102	\N	0
1106	\N	0
1108	\N	0
1112	\N	0
1114	\N	0
1123	\N	0
1125	\N	0
1126	\N	0
1129	\N	0
1136	\N	0
1142	\N	0
1143	\N	0
1145	\N	0
1156	\N	0
1158	\N	0
1159	\N	0
1160	\N	0
1166	\N	0
1171	\N	0
1173	\N	0
1174	\N	0
1179	\N	0
1180	\N	0
1186	\N	0
1188	\N	0
1191	\N	0
1192	\N	0
1193	\N	0
1194	\N	0
1196	\N	0
1198	\N	0
1204	\N	0
1209	\N	0
1213	\N	0
1214	\N	0
1217	\N	0
1218	\N	0
1219	\N	0
1220	\N	0
1223	\N	0
1225	\N	0
1226	\N	0
1227	\N	0
1228	\N	0
1235	\N	0
1242	\N	0
1244	\N	0
1245	\N	0
1249	\N	0
1254	\N	0
1255	\N	0
1257	\N	0
1260	\N	0
1262	\N	0
1266	\N	0
1267	\N	0
1269	\N	0
1274	\N	0
1275	\N	0
1276	\N	0
1279	\N	0
1282	\N	0
1287	\N	0
1293	\N	0
1300	\N	0
1301	\N	0
1302	\N	0
1304	\N	0
1305	\N	0
1307	\N	0
1310	\N	0
1312	\N	0
1315	\N	0
1317	\N	0
1319	\N	0
1321	\N	0
1322	\N	0
1323	\N	0
1325	\N	0
1329	\N	0
1332	\N	0
1334	\N	0
1335	\N	0
1339	\N	0
1343	\N	0
1348	\N	0
1350	\N	0
1351	\N	0
1352	\N	0
1355	\N	0
1356	\N	0
1357	\N	0
1359	\N	0
1360	\N	0
1364	\N	0
1366	\N	0
1369	\N	0
1370	\N	0
1376	\N	0
1378	\N	0
1380	\N	0
1382	\N	0
1390	\N	0
1394	\N	0
1397	\N	0
1398	\N	0
1402	\N	0
1403	\N	0
1405	\N	0
1409	\N	0
1410	\N	0
1411	\N	0
1412	\N	0
1413	\N	0
1414	\N	0
1415	\N	0
1416	\N	0
1417	\N	0
1418	\N	0
1419	\N	0
1420	\N	0
1425	\N	0
1427	\N	0
1429	\N	0
1436	\N	0
1437	\N	0
1438	\N	0
1439	\N	0
1446	\N	0
1448	\N	0
1458	\N	0
1459	\N	0
1462	\N	0
1465	\N	0
1466	\N	0
1467	\N	0
1468	\N	0
1472	\N	0
1473	\N	0
1475	\N	0
1476	\N	0
1485	\N	0
1493	\N	0
1495	\N	0
1496	\N	0
1502	\N	0
1503	\N	0
1505	\N	0
1507	\N	0
1517	\N	0
1518	\N	0
1519	\N	0
1520	\N	0
1522	\N	0
1524	\N	0
1526	\N	0
1528	\N	0
1529	\N	0
1530	\N	0
1541	\N	0
1542	\N	0
1543	\N	0
1550	\N	0
1553	\N	0
1557	\N	0
1561	\N	0
1562	\N	0
1565	\N	0
1568	\N	0
1570	\N	0
1580	\N	0
1581	\N	0
1582	\N	0
1583	\N	0
1590	\N	0
1591	\N	0
1593	\N	0
1594	\N	0
1596	\N	0
1602	\N	0
1603	\N	0
1611	\N	0
1615	\N	0
1618	\N	0
1620	\N	0
1624	\N	0
1629	\N	0
1632	\N	0
1634	\N	0
1637	\N	0
1642	\N	0
1648	\N	0
1658	\N	0
1662	\N	0
1664	\N	0
1666	\N	0
1672	\N	0
1677	\N	0
1678	\N	0
1681	\N	0
1683	\N	0
1688	\N	0
1690	\N	0
1696	\N	0
1702	\N	0
1705	\N	0
1709	\N	0
1711	\N	0
1719	\N	0
1720	\N	0
1726	\N	0
1727	\N	0
1730	\N	0
1734	\N	0
1737	\N	0
1739	\N	0
1744	\N	0
1745	\N	0
1748	\N	0
1750	\N	0
1753	\N	0
1758	\N	0
1759	\N	0
1761	\N	0
1765	\N	0
1767	\N	0
1768	\N	0
1773	\N	0
1775	\N	0
1781	\N	0
1787	\N	0
1790	\N	0
1793	\N	0
1797	\N	0
1801	\N	0
1803	\N	0
1807	\N	0
1813	\N	0
1815	\N	0
1819	\N	0
1821	\N	0
1829	\N	0
1835	\N	0
1839	\N	0
1843	\N	0
1852	\N	0
1854	\N	0
1855	\N	0
1862	\N	0
1867	\N	0
1868	\N	0
1869	\N	0
1873	\N	0
1877	\N	0
1879	\N	0
1882	\N	0
1888	\N	0
1891	\N	0
1895	\N	0
1900	\N	0
1902	\N	0
1904	\N	0
1905	\N	0
1911	\N	0
1914	\N	0
1918	\N	0
1928	\N	0
1933	\N	0
1939	\N	0
1946	\N	0
1948	\N	0
1952	\N	0
1959	\N	0
1965	\N	0
1968	\N	0
1971	\N	0
1980	\N	0
1987	\N	0
1991	\N	0
1993	\N	0
1996	\N	0
2003	\N	0
2004	\N	0
2006	\N	0
2008	\N	0
2009	\N	0
2012	\N	0
2016	\N	0
2017	\N	0
2026	\N	0
2027	\N	0
2032	\N	0
2043	\N	0
2050	\N	0
2051	\N	0
2054	\N	0
2055	\N	0
2056	\N	0
2060	\N	0
2061	\N	0
2063	\N	0
2064	\N	0
2065	\N	0
2066	\N	0
2070	\N	0
2072	\N	0
2076	\N	0
2082	\N	0
2091	\N	0
2094	\N	0
2096	\N	0
2104	\N	0
2107	\N	0
2117	\N	0
2118	\N	0
2119	\N	0
2123	\N	0
2125	\N	0
2127	\N	0
2129	\N	0
2135	\N	0
2137	\N	0
2142	\N	0
2144	\N	0
2145	\N	0
2147	\N	0
2152	\N	0
2158	\N	0
2159	\N	0
2160	\N	0
2161	\N	0
2164	\N	0
2167	\N	0
2173	\N	0
2174	\N	0
2178	\N	0
2181	\N	0
2188	\N	0
2189	\N	0
2198	\N	0
2200	\N	0
2202	\N	0
2204	\N	0
2205	\N	0
2212	\N	0
2219	\N	0
2227	\N	0
2228	\N	0
2229	\N	0
2235	\N	0
2241	\N	0
2242	\N	0
2244	\N	0
2247	\N	0
2251	\N	0
2256	\N	0
2264	\N	0
2270	\N	0
2272	\N	0
2279	\N	0
2282	\N	0
2286	\N	0
2300	\N	0
2302	\N	0
2312	\N	0
2315	\N	0
2321	\N	0
2323	\N	0
2328	\N	0
2330	\N	0
2339	\N	0
2341	\N	0
2345	\N	0
2349	\N	0
2350	\N	0
2360	\N	0
2366	\N	0
2374	\N	0
2377	\N	0
2382	\N	0
2385	\N	0
2398	\N	0
2399	\N	0
2404	\N	0
2408	\N	0
2416	\N	0
2418	\N	0
2420	\N	0
2423	\N	0
2425	\N	0
2426	\N	0
2428	\N	0
2431	\N	0
2449	\N	0
2453	\N	0
2469	\N	0
2473	\N	0
2476	\N	0
2483	\N	0
2490	\N	0
2491	\N	0
2495	\N	0
2500	\N	0
2504	\N	0
2513	\N	0
2520	\N	0
2525	\N	0
2528	\N	0
2531	\N	0
2533	\N	0
2552	\N	0
2556	\N	0
2562	\N	0
2566	\N	0
2571	\N	0
2586	\N	0
2587	\N	0
2589	\N	0
2592	\N	0
2595	\N	0
2603	\N	0
2607	\N	0
2612	\N	0
2617	\N	0
2619	\N	0
2623	\N	0
2624	\N	0
2638	\N	0
2655	\N	0
2661	\N	0
2662	\N	0
2669	\N	0
2679	\N	0
2689	\N	0
2692	\N	0
2699	\N	0
2706	\N	0
2721	\N	0
2729	\N	0
2731	\N	0
2735	\N	0
2737	\N	0
2739	\N	0
2750	\N	0
2753	\N	0
2756	\N	0
2763	\N	0
2782	\N	0
2783	\N	0
2831	\N	0
2846	\N	0
2871	\N	0
2886	\N	0
2910	\N	0
2921	\N	0
2926	\N	0
2927	\N	0
2954	\N	0
2960	\N	0
2973	\N	0
2998	\N	0
3007	\N	0
3012	\N	0
3043	\N	0
\.



COPY "assignReviewer" ("Administrator", "Reviewer") FROM stdin;
\.



COPY "co-writePaper" ("Co-author", "Paper") FROM stdin;
13	14
13	15
19	16
30	25
30	2370
35	419
35	420
38	34
38	421
46	43
47	1177
51	413
51	418
54	49
54	2260
64	485
67	62
67	483
71	76
71	80
83	81
86	490
86	492
93	89
99	607
107	1480
112	108
118	114
126	1120
126	1122
129	1725
131	127
131	362
135	1121
139	1387
143	827
144	700
144	1941
147	142
154	151
161	165
174	173
176	1392
180	175
180	533
195	1791
196	2098
196	2101
197	284
199	194
201	105
209	210
213	211
217	220
217	221
227	207
228	72
257	256
270	268
275	1981
279	1289
279	1712
288	473
291	287
301	1498
305	302
305	1573
352	350
357	354
359	360
372	373
382	595
385	383
396	398
396	400
401	313
405	404
412	414
412	417
432	430
432	512
443	444
445	446
458	411
459	888
460	455
460	1512
466	2436
497	500
497	503
516	1999
516	2000
520	393
544	651
549	954
551	539
560	617
561	556
566	190
567	568
572	570
581	938
592	594
605	678
605	679
606	602
615	618
620	619
622	1
623	2361
623	2364
627	625
629	1997
641	1817
644	640
644	1785
661	659
673	8
686	1362
691	1034
693	806
693	962
701	2090
710	1668
710	1669
713	708
720	164
720	167
721	717
721	1264
725	2087
725	2088
734	730
735	1252
735	1548
738	739
738	740
747	745
753	499
753	502
755	1527
756	754
766	764
770	772
777	774
794	795
801	798
808	1331
809	815
819	2511
821	925
822	820
822	2191
828	1920
833	239
836	834
843	521
844	847
856	855
856	1238
858	265
859	750
877	878
884	879
887	803
896	310
911	906
915	914
921	9
921	12
923	924
927	1231
927	1232
928	699
935	933
935	991
936	1168
941	939
961	489
964	965
971	1265
972	973
983	985
992	994
992	996
998	870
998	871
1004	1005
1004	1006
1018	1019
1021	486
1050	2110
1050	2183
1051	995
1058	1202
1058	2557
1064	655
1064	656
1069	1066
1076	978
1087	684
1092	1811
1092	2333
1098	1871
1102	1103
1106	422
1158	850
1158	851
1179	2468
1180	1181
1191	1241
1192	1487
1192	1488
1193	1190
1193	1930
1194	2383
1218	1216
1220	1431
1225	77
1225	78
1227	793
1245	1248
1257	1256
1257	1346
1260	1934
1260	1936
1262	1452
1262	1453
1267	1865
1275	1273
1275	2089
1276	1396
1279	241
1279	244
1301	392
1301	394
1307	1303
1310	1910
1312	1313
1319	848
1323	1320
1329	1795
1350	771
1350	773
1352	931
1366	1251
1369	1625
1378	1148
1378	1152
1402	231
1403	960
1436	1434
1438	591
1439	508
1459	654
1462	1035
1465	1464
1465	2276
1473	637
1473	639
1493	1494
1495	247
1505	1501
1507	507
1519	1515
1522	949
1524	1031
1528	1443
1529	1165
1541	854
1565	1566
1568	2512
1580	1578
1590	1588
1602	1042
1603	1604
1603	1605
1611	547
1615	1616
1620	1477
1620	1479
1642	1643
1648	1649
1677	1675
1677	1827
1688	505
1690	1043
1711	1848
1720	2310
1734	1733
1745	59
1748	696
1758	1599
1759	868
1761	1760
1761	1998
1765	1478
1765	1482
1775	974
1775	979
1797	1115
1801	763
1803	1804
1807	1630
1819	1670
1829	1828
1829	2402
1835	1836
1843	408
1852	1853
1854	671
1862	1864
1869	1870
1873	266
1877	1081
1877	1082
1879	298
1882	1647
1888	905
1900	188
1911	1033
1911	1038
1914	299
1933	368
1948	789
1959	229
1959	232
1971	667
1971	669
1987	1988
1991	1990
1991	2141
1996	2319
2003	1794
2006	2007
2009	1789
2012	33
2016	650
2026	786
2043	506
2043	509
2050	2048
2064	611
2065	491
2104	1536
2107	2108
2119	124
2127	2128
2135	2134
2144	249
2144	252
2152	1483
2161	1014
2164	1199
2174	103
2181	1897
2188	2121
2200	2197
2202	437
2212	479
2219	399
2242	1707
2247	1295
2256	2169
2256	2170
2264	1983
2270	853
2272	374
2272	376
2286	2179
2321	2281
2328	2327
2349	1656
2350	1534
2350	1535
2366	1450
2377	250
2399	2150
2416	904
2418	849
2469	1395
2473	969
2476	526
2483	984
2491	1907
2495	1800
2504	1093
2504	1094
2513	309
2520	1164
2525	242
2531	608
2531	609
2552	2255
2556	2095
2562	1944
2566	2034
2571	1545
2589	2585
2592	536
2595	707
2603	240
2607	1130
2617	1337
2619	1169
2661	1600
2689	1132
2692	1455
2699	1028
2706	191
2729	1153
2735	160
2737	635
2739	2728
2750	1017
2763	1138
2782	1738
2846	1917
2871	2273
2921	527
2927	788
2960	185
2998	1407
3007	1147
3012	4
3043	1875
\.



COPY "detailsEnteredBy" ("Conference", "Administrator") FROM stdin;
\.



COPY "enableVirtualMeeting" ("Administrator", "Conference") FROM stdin;
\.



COPY "endReview" ("ProgramCommitteeChair", "Review") FROM stdin;
\.



COPY "enterReviewCriteria" ("Administrator", "Conference") FROM stdin;
\.



COPY "finalizePaperAssignment" ("Administrator", "Conference") FROM stdin;
\.



COPY "hardcopyMailingManifestsP" ("Conference", "Administrator") FROM stdin;
\.



COPY "hasConferenceMember" ("Conference", "ConferenceMember") FROM stdin;
7	5
7	20
7	31
7	84
7	113
7	449
7	541
7	584
7	633
7	647
7	731
7	759
7	784
7	1011
7	1089
7	1112
7	1173
7	1266
7	1287
7	1305
7	1317
7	1334
7	1382
7	1409
7	1410
7	1411
7	1412
7	1413
7	1414
7	1415
7	1416
7	1417
7	1418
7	1419
7	1420
79	35
79	47
79	71
79	90
79	119
79	121
79	153
79	171
79	196
79	212
79	260
79	262
79	289
79	295
79	315
79	427
79	544
79	642
79	701
79	715
79	797
79	833
79	881
79	886
79	908
79	927
79	951
79	1044
79	1045
79	1046
79	1047
79	1048
79	1049
79	1050
79	1051
79	1052
79	1053
79	1054
79	1055
79	1056
79	1057
79	1058
79	1059
79	1060
79	1061
163	88
163	99
163	129
163	135
163	139
163	161
163	248
163	306
163	434
163	458
163	466
163	520
163	555
163	581
163	615
163	652
163	691
163	777
163	808
163	936
163	971
163	1159
163	1174
163	1179
163	1191
163	1245
163	1352
163	1466
163	1568
163	1602
163	1711
163	2026
163	2160
163	2408
163	2491
163	2669
208	42
208	141
208	155
208	200
208	205
208	245
208	271
208	290
208	316
208	317
208	319
208	320
208	321
208	322
208	323
208	324
208	325
208	326
208	327
208	328
208	329
208	330
208	331
208	332
208	333
208	334
208	335
208	336
208	337
208	338
208	339
208	340
208	341
208	342
208	343
208	344
208	345
208	346
208	347
208	348
208	349
219	27
219	51
219	64
219	126
219	217
219	388
219	450
219	560
219	585
219	660
219	688
219	720
219	725
219	743
219	753
219	843
219	946
219	1000
219	1026
219	1073
219	1193
219	1242
219	1260
219	1310
219	1475
219	1813
219	2082
230	107
230	143
230	176
230	199
230	228
230	435
230	471
230	604
230	629
230	689
230	819
230	844
230	1098
230	1142
230	1220
230	1244
230	1462
230	1507
230	1634
230	1666
230	1737
230	1744
230	1904
230	1918
230	1928
230	2060
230	2061
230	2063
230	2064
230	2065
230	2066
254	39
254	88
254	96
254	99
254	135
254	139
254	248
254	261
254	281
254	286
254	434
254	458
254	552
254	555
254	645
254	652
254	691
254	702
254	727
254	777
254	791
254	830
254	874
254	893
254	1159
254	1186
254	1191
254	1209
254	1254
254	1355
254	1429
254	1568
254	1602
254	1672
254	1753
254	2117
254	2158
254	2159
254	2160
395	27
395	38
395	51
395	64
395	144
395	177
395	279
395	388
395	462
395	464
395	516
395	693
395	710
395	720
395	725
395	817
395	946
395	998
395	1025
395	1039
395	1101
395	1225
395	1242
395	1260
395	1315
395	1356
395	1370
395	1620
395	2082
395	2272
\.



COPY "hasConflictOfInterest" ("Person", "Document") FROM stdin;
\.



COPY "hasProgramCommitteeMember" ("ProgramCommittee", "ProgramCommitteeMember") FROM stdin;
448	51
448	449
448	450
448	451
873	497
873	581
873	874
873	875
873	876
2201	115
2201	121
2201	876
2201	886
2201	958
2201	2160
2201	2202
2216	169
2216	316
2216	324
2216	330
2216	380
2216	470
2216	1581
2226	604
2226	819
2226	2227
2226	2228
2226	2229
2365	177
2365	682
2365	1160
2365	1409
2365	2350
2928	129
2928	137
2928	537
2928	1092
2928	1159
2928	1186
2933	597
2933	725
2933	1073
2933	1356
2933	2423
\.



COPY "hasSubjectArea" ("Paper", "SubjectArea") FROM stdin;
\.



COPY "markConflictOfInterest" ("ConferenceMember", "Paper") FROM stdin;
\.



COPY "paperAssignmentToolsRunBy" ("Conference", "Administrator") FROM stdin;
\.



COPY "reviewerBiddingStartedBy" ("Conference", "Administrator") FROM stdin;
\.



COPY "setMaxPapers" ("Administrator", "ProgramCommitteeMember") FROM stdin;
\.



COPY "submitPaper" ("Author", "Paper") FROM stdin;
\.



ALTER TABLE ONLY "Author"
    ADD CONSTRAINT "AuthorPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Bid"
    ADD CONSTRAINT "BidPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Conference"
    ADD CONSTRAINT "ConferencePK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Document"
    ADD CONSTRAINT "DocumentPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "PaperPK" PRIMARY KEY ("ID", "Reviewer");



ALTER TABLE ONLY "Person"
    ADD CONSTRAINT "PersonPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Preference"
    ADD CONSTRAINT "PreferencePK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "ProgramCommitteeChair"
    ADD CONSTRAINT "ProgramCommitteeChairPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "ProgramCommitteeMember"
    ADD CONSTRAINT "ProgramCommitteeMemberPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "ProgramCommittee"
    ADD CONSTRAINT "ProgramCommitteePK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Rejection"
    ADD CONSTRAINT "RejectionPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "SubjectArea"
    ADD CONSTRAINT "SubjectAreaPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "User"
    ADD CONSTRAINT "UserPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "assignReviewer"
    ADD CONSTRAINT "assignReviewerPK" PRIMARY KEY ("Administrator", "Reviewer");



ALTER TABLE ONLY "co-writePaper"
    ADD CONSTRAINT "co-writePaperPK" PRIMARY KEY ("Co-author", "Paper");



ALTER TABLE ONLY "detailsEnteredBy"
    ADD CONSTRAINT "detailsEnteredByPK" PRIMARY KEY ("Conference", "Administrator");



ALTER TABLE ONLY "enableVirtualMeeting"
    ADD CONSTRAINT "enableVirtualMeetingPK" PRIMARY KEY ("Administrator", "Conference");



ALTER TABLE ONLY "endReview"
    ADD CONSTRAINT "endReviewPK" PRIMARY KEY ("ProgramCommitteeChair", "Review");



ALTER TABLE ONLY "enterReviewCriteria"
    ADD CONSTRAINT "enterReviewCriteriaPK" PRIMARY KEY ("Administrator", "Conference");



ALTER TABLE ONLY "finalizePaperAssignment"
    ADD CONSTRAINT "finalizePaperAssignmentPK" PRIMARY KEY ("Administrator", "Conference");



ALTER TABLE ONLY "hardcopyMailingManifestsP"
    ADD CONSTRAINT "hardcopyMailingManifestsPPK" PRIMARY KEY ("Conference", "Administrator");



ALTER TABLE ONLY "hasConferenceMember"
    ADD CONSTRAINT "hasConferenceMemberPK" PRIMARY KEY ("Conference", "ConferenceMember");



ALTER TABLE ONLY "hasConflictOfInterest"
    ADD CONSTRAINT "hasConflictOfInterestPK" PRIMARY KEY ("Person", "Document");



ALTER TABLE ONLY "hasProgramCommitteeMember"
    ADD CONSTRAINT "hasProgramCommitteeMemberPK" PRIMARY KEY ("ProgramCommittee", "ProgramCommitteeMember");



ALTER TABLE ONLY "hasSubjectArea"
    ADD CONSTRAINT "hasSubjectAreaPK" PRIMARY KEY ("Paper", "SubjectArea");



ALTER TABLE ONLY "markConflictOfInterest"
    ADD CONSTRAINT "markConflictOfInterestPK" PRIMARY KEY ("ConferenceMember", "Paper");



ALTER TABLE ONLY "paperAssignmentToolsRunBy"
    ADD CONSTRAINT "paperAssignmentToolsRunByPK" PRIMARY KEY ("Conference", "Administrator");



ALTER TABLE ONLY "reviewerBiddingStartedBy"
    ADD CONSTRAINT "reviewerBiddingStartedByPK" PRIMARY KEY ("Conference", "Administrator");



ALTER TABLE ONLY "setMaxPapers"
    ADD CONSTRAINT "setMaxPapersPK" PRIMARY KEY ("Administrator", "ProgramCommitteeMember");



ALTER TABLE ONLY "submitPaper"
    ADD CONSTRAINT "submitPaperPK" PRIMARY KEY ("Author", "Paper");



ALTER TABLE ONLY "Author"
    ADD CONSTRAINT "AuthorURIFK" FOREIGN KEY ("ID") REFERENCES "Person"("ID");



ALTER TABLE ONLY "Author"
    ADD CONSTRAINT "AuthorURIFK2" FOREIGN KEY ("ID") REFERENCES "User"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "ProgramCommitteeChair"
    ADD CONSTRAINT "ChairmanURIFK" FOREIGN KEY ("ID") REFERENCES "Person"("ID");



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "PaperURIFK" FOREIGN KEY ("ID") REFERENCES "Document"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "PaperacceptedByFK" FOREIGN KEY ("acceptedBy") REFERENCES "User"("ID");



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "PaperhasAuthorFK" FOREIGN KEY ("hasAuthor") REFERENCES "Author"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "PaperhasDecisionFK" FOREIGN KEY ("hasDecision") REFERENCES "Rejection"("ID");



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "PaperrejectedByFK" FOREIGN KEY ("rejectedBy") REFERENCES "User"("ID");



ALTER TABLE ONLY "ProgramCommitteeChair"
    ADD CONSTRAINT "ProgramCommitteeChairURIFK2" FOREIGN KEY ("ID") REFERENCES "ProgramCommitteeMember"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "ProgramCommitteeMember"
    ADD CONSTRAINT "ProgramCommitteeMemberURIFK" FOREIGN KEY ("ID") REFERENCES "Person"("ID");



ALTER TABLE ONLY "ProgramCommitteeMember"
    ADD CONSTRAINT "ProgramCommitteeMemberadd" FOREIGN KEY ("addedBy") REFERENCES "User"("ID");



ALTER TABLE ONLY "User"
    ADD CONSTRAINT "UserURIFK" FOREIGN KEY ("ID") REFERENCES "Person"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "assignReviewer"
    ADD CONSTRAINT "assignReviewerAdministratorFK" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "co-writePaper"
    ADD CONSTRAINT "co-writePaperCo-authorFK" FOREIGN KEY ("Co-author") REFERENCES "Author"("ID");



ALTER TABLE ONLY "detailsEnteredBy"
    ADD CONSTRAINT "detailsEnteredByAdministr" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "detailsEnteredBy"
    ADD CONSTRAINT "detailsEnteredByConferenceFK" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "enableVirtualMeeting"
    ADD CONSTRAINT "enableVirtualMeetingAdmin" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "enableVirtualMeeting"
    ADD CONSTRAINT "enableVirtualMeetingConfe" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "endReview"
    ADD CONSTRAINT "endReviewProgramCommittee" FOREIGN KEY ("ProgramCommitteeChair") REFERENCES "ProgramCommitteeChair"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "endReview"
    ADD CONSTRAINT "endReviewReviewFK" FOREIGN KEY ("Review") REFERENCES "Document"("ID");



ALTER TABLE ONLY "enterReviewCriteria"
    ADD CONSTRAINT "enterReviewCriteriaAdmini" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "enterReviewCriteria"
    ADD CONSTRAINT "enterReviewCriteriaConfer" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "finalizePaperAssignment"
    ADD CONSTRAINT "finalizePaperAssignmentAd" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "finalizePaperAssignment"
    ADD CONSTRAINT "finalizePaperAssignmentCo" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "hardcopyMailingManifestsP"
    ADD CONSTRAINT "hardcopyMailingManifestsP" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "hardcopyMailingManifestsP"
    ADD CONSTRAINT "hardcopyMailingManifestsPAd2FK" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "hasConferenceMember"
    ADD CONSTRAINT "hasConferenceMemberConfer" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "hasConflictOfInterest"
    ADD CONSTRAINT "hasConflictOfInterestDocu" FOREIGN KEY ("Document") REFERENCES "Document"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "hasConflictOfInterest"
    ADD CONSTRAINT "hasConflictOfInterestPersonFK" FOREIGN KEY ("Person") REFERENCES "Person"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "hasProgramCommitteeMember"
    ADD CONSTRAINT "hasProgramCommitteeMember" FOREIGN KEY ("ProgramCommittee") REFERENCES "ProgramCommittee"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "hasSubjectArea"
    ADD CONSTRAINT "hasSubjectAreaSubjectAreaFK" FOREIGN KEY ("SubjectArea") REFERENCES "SubjectArea"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "paperAssignmentToolsRunBy"
    ADD CONSTRAINT "paperAssignmentToolsRunBy" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "paperAssignmentToolsRunBy"
    ADD CONSTRAINT "paperAssignmentToolsRunByAd2FK" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "reviewerBiddingStartedBy"
    ADD CONSTRAINT "reviewerBiddingStartedByA" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "reviewerBiddingStartedBy"
    ADD CONSTRAINT "reviewerBiddingStartedByC" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "reviewerIsPerson" FOREIGN KEY ("Reviewer") REFERENCES "Person"("ID");



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "reviewerIsUser" FOREIGN KEY ("Reviewer") REFERENCES "User"("ID");



ALTER TABLE ONLY "setMaxPapers"
    ADD CONSTRAINT "setMaxPapersAdministratorFK" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "submitPaper"
    ADD CONSTRAINT "submitPaperAuthorFK" FOREIGN KEY ("Author") REFERENCES "Author"("ID") ON DELETE CASCADE;
