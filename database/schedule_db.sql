--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: prak
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO prak;

--
-- Name: schedule; Type: TABLE; Schema: public; Owner: prak
--

CREATE TABLE public.schedule (
    id integer NOT NULL,
    day character varying(10) NOT NULL,
    time_range character varying(20) NOT NULL,
    availability integer NOT NULL
);


ALTER TABLE public.schedule OWNER TO prak;

--
-- Name: schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: prak
--

CREATE SEQUENCE public.schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.schedule_id_seq OWNER TO prak;

--
-- Name: schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prak
--

ALTER SEQUENCE public.schedule_id_seq OWNED BY public.schedule.id;


--
-- Name: schedule id; Type: DEFAULT; Schema: public; Owner: prak
--

ALTER TABLE ONLY public.schedule ALTER COLUMN id SET DEFAULT nextval('public.schedule_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: prak
--

COPY public.alembic_version (version_num) FROM stdin;
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: prak
--

COPY public.schedule (id, day, time_range, availability) FROM stdin;
136	Senin	07:00 - 09.00	1
137	Senin	08:00 - 10.00	1
138	Senin	09:00 - 11.00	1
139	Senin	10:00 - 12.00	1
140	Senin	11:00 - 13.00	1
141	Senin	12:00 - 14.00	0
142	Senin	13:00 - 15.00	0
143	Senin	14:00 - 16.00	0
144	Senin	15:00 - 17.00	0
145	Selasa	07:00 - 09.00	0
146	Selasa	08:00 - 10.00	0
147	Selasa	09:00 - 11.00	0
148	Selasa	10:00 - 12.00	0
149	Selasa	11:00 - 13.00	0
150	Selasa	12:00 - 14.00	0
151	Selasa	13:00 - 15.00	0
152	Selasa	14:00 - 16.00	0
153	Selasa	15:00 - 17.00	0
154	Rabu	07:00 - 09.00	0
155	Rabu	08:00 - 10.00	1
156	Rabu	09:00 - 11.00	0
157	Rabu	10:00 - 12.00	0
158	Rabu	11:00 - 13.00	0
159	Rabu	12:00 - 14.00	0
160	Rabu	13:00 - 15.00	0
161	Rabu	14:00 - 16.00	0
162	Rabu	15:00 - 17.00	0
163	Kamis	07:00 - 09.00	0
164	Kamis	08:00 - 10.00	0
165	Kamis	09:00 - 11.00	0
166	Kamis	10:00 - 12.00	0
167	Kamis	11:00 - 13.00	0
168	Kamis	12:00 - 14.00	1
169	Kamis	13:00 - 15.00	1
170	Kamis	14:00 - 16.00	1
171	Kamis	15:00 - 17.00	1
172	Jumat	07:00 - 09.00	0
173	Jumat	08:00 - 10.00	0
174	Jumat	09:00 - 11.00	1
175	Jumat	10:00 - 12.00	0
176	Jumat	11:00 - 13.00	0
177	Jumat	12:00 - 14.00	0
178	Jumat	13:00 - 15.00	0
179	Jumat	14:00 - 16.00	0
180	Jumat	15:00 - 17.00	0
\.


--
-- Name: schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prak
--

SELECT pg_catalog.setval('public.schedule_id_seq', 180, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: prak
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: prak
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

