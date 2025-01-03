--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15 (Ubuntu 14.15-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.15 (Ubuntu 14.15-0ubuntu0.22.04.1)

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

--
-- Name: <schema>; Type: SCHEMA; Schema: -; Owner: kurvers
--

CREATE SCHEMA "<schema>";


ALTER SCHEMA "<schema>" OWNER TO kurvers;

--
-- Name: PermissionType; Type: TYPE; Schema: <schema>; Owner: kurvers
--

CREATE TYPE "<schema>"."PermissionType" AS ENUM (
    'READ',
    'WRITE',
    'UPDATE',
    'DELETE'
);


ALTER TYPE "<schema>"."PermissionType" OWNER TO kurvers;

--
-- Name: PermissionType; Type: TYPE; Schema: public; Owner: kurvers
--

CREATE TYPE public."PermissionType" AS ENUM (
    'READ',
    'WRITE',
    'UPDATE',
    'DELETE'
);


ALTER TYPE public."PermissionType" OWNER TO kurvers;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Activity_log; Type: TABLE; Schema: <schema>; Owner: kurvers
--

CREATE TABLE "<schema>"."Activity_log" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    action text NOT NULL,
    "dateAdded" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    activity text NOT NULL
);


ALTER TABLE "<schema>"."Activity_log" OWNER TO kurvers;

--
-- Name: Activity_log_id_seq; Type: SEQUENCE; Schema: <schema>; Owner: kurvers
--

CREATE SEQUENCE "<schema>"."Activity_log_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "<schema>"."Activity_log_id_seq" OWNER TO kurvers;

--
-- Name: Activity_log_id_seq; Type: SEQUENCE OWNED BY; Schema: <schema>; Owner: kurvers
--

ALTER SEQUENCE "<schema>"."Activity_log_id_seq" OWNED BY "<schema>"."Activity_log".id;


--
-- Name: Banner; Type: TABLE; Schema: <schema>; Owner: kurvers
--

CREATE TABLE "<schema>"."Banner" (
    id integer NOT NULL,
    banner text NOT NULL,
    type text NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    "isButtonVisible" boolean DEFAULT true NOT NULL,
    "buttonText" text,
    "buttonLink" text,
    "isDeleted" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE "<schema>"."Banner" OWNER TO kurvers;

--
-- Name: Banner_id_seq; Type: SEQUENCE; Schema: <schema>; Owner: kurvers
--

CREATE SEQUENCE "<schema>"."Banner_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "<schema>"."Banner_id_seq" OWNER TO kurvers;

--
-- Name: Banner_id_seq; Type: SEQUENCE OWNED BY; Schema: <schema>; Owner: kurvers
--

ALTER SEQUENCE "<schema>"."Banner_id_seq" OWNED BY "<schema>"."Banner".id;


--
-- Name: Configuration; Type: TABLE; Schema: <schema>; Owner: kurvers
--

CREATE TABLE "<schema>"."Configuration" (
    id integer NOT NULL,
    "dateAdded" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    label text NOT NULL,
    value text NOT NULL
);


ALTER TABLE "<schema>"."Configuration" OWNER TO kurvers;

--
-- Name: Configuration_id_seq; Type: SEQUENCE; Schema: <schema>; Owner: kurvers
--

CREATE SEQUENCE "<schema>"."Configuration_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "<schema>"."Configuration_id_seq" OWNER TO kurvers;

--
-- Name: Configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: <schema>; Owner: kurvers
--

ALTER SEQUENCE "<schema>"."Configuration_id_seq" OWNED BY "<schema>"."Configuration".id;


--
-- Name: Job; Type: TABLE; Schema: <schema>; Owner: kurvers
--

CREATE TABLE "<schema>"."Job" (
    title text NOT NULL,
    location text NOT NULL,
    type text NOT NULL,
    description text NOT NULL,
    "dateAdded" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "isDeleted" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    responsibilities text[],
    requirements text[],
    id integer NOT NULL
);


ALTER TABLE "<schema>"."Job" OWNER TO kurvers;

--
-- Name: JobApply; Type: TABLE; Schema: <schema>; Owner: kurvers
--

CREATE TABLE "<schema>"."JobApply" (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    phone text NOT NULL,
    "coverLetter" text NOT NULL,
    resume text NOT NULL,
    "appliedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "jobId" integer NOT NULL
);


ALTER TABLE "<schema>"."JobApply" OWNER TO kurvers;

--
-- Name: JobApply_id_seq; Type: SEQUENCE; Schema: <schema>; Owner: kurvers
--

CREATE SEQUENCE "<schema>"."JobApply_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "<schema>"."JobApply_id_seq" OWNER TO kurvers;

--
-- Name: JobApply_id_seq; Type: SEQUENCE OWNED BY; Schema: <schema>; Owner: kurvers
--

ALTER SEQUENCE "<schema>"."JobApply_id_seq" OWNED BY "<schema>"."JobApply".id;


--
-- Name: Job_id_seq; Type: SEQUENCE; Schema: <schema>; Owner: kurvers
--

CREATE SEQUENCE "<schema>"."Job_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "<schema>"."Job_id_seq" OWNER TO kurvers;

--
-- Name: Job_id_seq; Type: SEQUENCE OWNED BY; Schema: <schema>; Owner: kurvers
--

ALTER SEQUENCE "<schema>"."Job_id_seq" OWNED BY "<schema>"."Job".id;


--
-- Name: Permission; Type: TABLE; Schema: <schema>; Owner: kurvers
--

CREATE TABLE "<schema>"."Permission" (
    id integer NOT NULL,
    "PermissionName" text NOT NULL
);


ALTER TABLE "<schema>"."Permission" OWNER TO kurvers;

--
-- Name: Permission_id_seq; Type: SEQUENCE; Schema: <schema>; Owner: kurvers
--

CREATE SEQUENCE "<schema>"."Permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "<schema>"."Permission_id_seq" OWNER TO kurvers;

--
-- Name: Permission_id_seq; Type: SEQUENCE OWNED BY; Schema: <schema>; Owner: kurvers
--

ALTER SEQUENCE "<schema>"."Permission_id_seq" OWNED BY "<schema>"."Permission".id;


--
-- Name: Role; Type: TABLE; Schema: <schema>; Owner: kurvers
--

CREATE TABLE "<schema>"."Role" (
    id integer NOT NULL,
    "RoleName" text NOT NULL,
    "dateAdded" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "isDeleted" boolean DEFAULT false NOT NULL
);


ALTER TABLE "<schema>"."Role" OWNER TO kurvers;

--
-- Name: Role_Permission; Type: TABLE; Schema: <schema>; Owner: kurvers
--

CREATE TABLE "<schema>"."Role_Permission" (
    id integer NOT NULL,
    "roleId" integer NOT NULL,
    "permissionId" integer NOT NULL,
    type "<schema>"."PermissionType" NOT NULL
);


ALTER TABLE "<schema>"."Role_Permission" OWNER TO kurvers;

--
-- Name: Role_Permission_id_seq; Type: SEQUENCE; Schema: <schema>; Owner: kurvers
--

CREATE SEQUENCE "<schema>"."Role_Permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "<schema>"."Role_Permission_id_seq" OWNER TO kurvers;

--
-- Name: Role_Permission_id_seq; Type: SEQUENCE OWNED BY; Schema: <schema>; Owner: kurvers
--

ALTER SEQUENCE "<schema>"."Role_Permission_id_seq" OWNED BY "<schema>"."Role_Permission".id;


--
-- Name: Role_id_seq; Type: SEQUENCE; Schema: <schema>; Owner: kurvers
--

CREATE SEQUENCE "<schema>"."Role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "<schema>"."Role_id_seq" OWNER TO kurvers;

--
-- Name: Role_id_seq; Type: SEQUENCE OWNED BY; Schema: <schema>; Owner: kurvers
--

ALTER SEQUENCE "<schema>"."Role_id_seq" OWNED BY "<schema>"."Role".id;


--
-- Name: User; Type: TABLE; Schema: <schema>; Owner: kurvers
--

CREATE TABLE "<schema>"."User" (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "roleId" integer NOT NULL,
    "dateAdded" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "lastLogin" timestamp(3) without time zone,
    "isActive" boolean DEFAULT true NOT NULL,
    "profileImage" text,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "isDeleted" boolean DEFAULT false NOT NULL
);


ALTER TABLE "<schema>"."User" OWNER TO kurvers;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: <schema>; Owner: kurvers
--

CREATE SEQUENCE "<schema>"."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "<schema>"."User_id_seq" OWNER TO kurvers;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: <schema>; Owner: kurvers
--

ALTER SEQUENCE "<schema>"."User_id_seq" OWNED BY "<schema>"."User".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: <schema>; Owner: kurvers
--

CREATE TABLE "<schema>"._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE "<schema>"._prisma_migrations OWNER TO kurvers;

--
-- Name: Activity; Type: TABLE; Schema: public; Owner: kurvers
--

CREATE TABLE public."Activity" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Activity" OWNER TO kurvers;

--
-- Name: Activity_id_seq; Type: SEQUENCE; Schema: public; Owner: kurvers
--

CREATE SEQUENCE public."Activity_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Activity_id_seq" OWNER TO kurvers;

--
-- Name: Activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kurvers
--

ALTER SEQUENCE public."Activity_id_seq" OWNED BY public."Activity".id;


--
-- Name: Activity_log; Type: TABLE; Schema: public; Owner: kurvers
--

CREATE TABLE public."Activity_log" (
    id integer NOT NULL,
    "activityId" integer NOT NULL,
    "userId" integer NOT NULL,
    action text NOT NULL,
    "dateAdded" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Activity_log" OWNER TO kurvers;

--
-- Name: Activity_log_id_seq; Type: SEQUENCE; Schema: public; Owner: kurvers
--

CREATE SEQUENCE public."Activity_log_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Activity_log_id_seq" OWNER TO kurvers;

--
-- Name: Activity_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kurvers
--

ALTER SEQUENCE public."Activity_log_id_seq" OWNED BY public."Activity_log".id;


--
-- Name: Banner; Type: TABLE; Schema: public; Owner: kurvers
--

CREATE TABLE public."Banner" (
    id integer NOT NULL,
    banner text NOT NULL,
    type text NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    "isButtonVisible" boolean DEFAULT true NOT NULL,
    "buttonText" text,
    "buttonLink" text,
    "isDeleted" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Banner" OWNER TO kurvers;

--
-- Name: Banner_id_seq; Type: SEQUENCE; Schema: public; Owner: kurvers
--

CREATE SEQUENCE public."Banner_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Banner_id_seq" OWNER TO kurvers;

--
-- Name: Banner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kurvers
--

ALTER SEQUENCE public."Banner_id_seq" OWNED BY public."Banner".id;


--
-- Name: Configuration; Type: TABLE; Schema: public; Owner: kurvers
--

CREATE TABLE public."Configuration" (
    id integer NOT NULL,
    "dateAdded" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    label text NOT NULL,
    value text NOT NULL
);


ALTER TABLE public."Configuration" OWNER TO kurvers;

--
-- Name: Configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: kurvers
--

CREATE SEQUENCE public."Configuration_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Configuration_id_seq" OWNER TO kurvers;

--
-- Name: Configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kurvers
--

ALTER SEQUENCE public."Configuration_id_seq" OWNED BY public."Configuration".id;


--
-- Name: Job; Type: TABLE; Schema: public; Owner: kurvers
--

CREATE TABLE public."Job" (
    title text NOT NULL,
    location text NOT NULL,
    type text NOT NULL,
    description text NOT NULL,
    "dateAdded" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "isDeleted" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    responsibilities text[],
    requirements text[],
    id integer NOT NULL
);


ALTER TABLE public."Job" OWNER TO kurvers;

--
-- Name: JobApply; Type: TABLE; Schema: public; Owner: kurvers
--

CREATE TABLE public."JobApply" (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    phone text NOT NULL,
    "coverLetter" text NOT NULL,
    resume text NOT NULL,
    "appliedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "jobId" integer NOT NULL
);


ALTER TABLE public."JobApply" OWNER TO kurvers;

--
-- Name: JobApply_id_seq; Type: SEQUENCE; Schema: public; Owner: kurvers
--

CREATE SEQUENCE public."JobApply_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."JobApply_id_seq" OWNER TO kurvers;

--
-- Name: JobApply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kurvers
--

ALTER SEQUENCE public."JobApply_id_seq" OWNED BY public."JobApply".id;


--
-- Name: Job_id_seq; Type: SEQUENCE; Schema: public; Owner: kurvers
--

CREATE SEQUENCE public."Job_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Job_id_seq" OWNER TO kurvers;

--
-- Name: Job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kurvers
--

ALTER SEQUENCE public."Job_id_seq" OWNED BY public."Job".id;


--
-- Name: Permission; Type: TABLE; Schema: public; Owner: kurvers
--

CREATE TABLE public."Permission" (
    id integer NOT NULL,
    "PermissionName" text NOT NULL
);


ALTER TABLE public."Permission" OWNER TO kurvers;

--
-- Name: Permission_id_seq; Type: SEQUENCE; Schema: public; Owner: kurvers
--

CREATE SEQUENCE public."Permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Permission_id_seq" OWNER TO kurvers;

--
-- Name: Permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kurvers
--

ALTER SEQUENCE public."Permission_id_seq" OWNED BY public."Permission".id;


--
-- Name: Role; Type: TABLE; Schema: public; Owner: kurvers
--

CREATE TABLE public."Role" (
    id integer NOT NULL,
    "RoleName" text NOT NULL,
    "dateAdded" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "isDeleted" boolean DEFAULT false NOT NULL
);


ALTER TABLE public."Role" OWNER TO kurvers;

--
-- Name: Role_Permission; Type: TABLE; Schema: public; Owner: kurvers
--

CREATE TABLE public."Role_Permission" (
    id integer NOT NULL,
    "roleId" integer NOT NULL,
    "permissionId" integer NOT NULL,
    type public."PermissionType" NOT NULL
);


ALTER TABLE public."Role_Permission" OWNER TO kurvers;

--
-- Name: Role_Permission_id_seq; Type: SEQUENCE; Schema: public; Owner: kurvers
--

CREATE SEQUENCE public."Role_Permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Role_Permission_id_seq" OWNER TO kurvers;

--
-- Name: Role_Permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kurvers
--

ALTER SEQUENCE public."Role_Permission_id_seq" OWNED BY public."Role_Permission".id;


--
-- Name: Role_id_seq; Type: SEQUENCE; Schema: public; Owner: kurvers
--

CREATE SEQUENCE public."Role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Role_id_seq" OWNER TO kurvers;

--
-- Name: Role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kurvers
--

ALTER SEQUENCE public."Role_id_seq" OWNED BY public."Role".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: kurvers
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "roleId" integer NOT NULL,
    "dateAdded" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "lastLogin" timestamp(3) without time zone,
    "isActive" boolean DEFAULT true NOT NULL,
    "profileImage" text,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "isDeleted" boolean DEFAULT false NOT NULL
);


ALTER TABLE public."User" OWNER TO kurvers;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: kurvers
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_id_seq" OWNER TO kurvers;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kurvers
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: kurvers
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO kurvers;

--
-- Name: Activity_log id; Type: DEFAULT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Activity_log" ALTER COLUMN id SET DEFAULT nextval('"<schema>"."Activity_log_id_seq"'::regclass);


--
-- Name: Banner id; Type: DEFAULT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Banner" ALTER COLUMN id SET DEFAULT nextval('"<schema>"."Banner_id_seq"'::regclass);


--
-- Name: Configuration id; Type: DEFAULT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Configuration" ALTER COLUMN id SET DEFAULT nextval('"<schema>"."Configuration_id_seq"'::regclass);


--
-- Name: Job id; Type: DEFAULT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Job" ALTER COLUMN id SET DEFAULT nextval('"<schema>"."Job_id_seq"'::regclass);


--
-- Name: JobApply id; Type: DEFAULT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."JobApply" ALTER COLUMN id SET DEFAULT nextval('"<schema>"."JobApply_id_seq"'::regclass);


--
-- Name: Permission id; Type: DEFAULT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Permission" ALTER COLUMN id SET DEFAULT nextval('"<schema>"."Permission_id_seq"'::regclass);


--
-- Name: Role id; Type: DEFAULT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Role" ALTER COLUMN id SET DEFAULT nextval('"<schema>"."Role_id_seq"'::regclass);


--
-- Name: Role_Permission id; Type: DEFAULT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Role_Permission" ALTER COLUMN id SET DEFAULT nextval('"<schema>"."Role_Permission_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."User" ALTER COLUMN id SET DEFAULT nextval('"<schema>"."User_id_seq"'::regclass);


--
-- Name: Activity id; Type: DEFAULT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Activity" ALTER COLUMN id SET DEFAULT nextval('public."Activity_id_seq"'::regclass);


--
-- Name: Activity_log id; Type: DEFAULT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Activity_log" ALTER COLUMN id SET DEFAULT nextval('public."Activity_log_id_seq"'::regclass);


--
-- Name: Banner id; Type: DEFAULT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Banner" ALTER COLUMN id SET DEFAULT nextval('public."Banner_id_seq"'::regclass);


--
-- Name: Configuration id; Type: DEFAULT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Configuration" ALTER COLUMN id SET DEFAULT nextval('public."Configuration_id_seq"'::regclass);


--
-- Name: Job id; Type: DEFAULT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Job" ALTER COLUMN id SET DEFAULT nextval('public."Job_id_seq"'::regclass);


--
-- Name: JobApply id; Type: DEFAULT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."JobApply" ALTER COLUMN id SET DEFAULT nextval('public."JobApply_id_seq"'::regclass);


--
-- Name: Permission id; Type: DEFAULT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Permission" ALTER COLUMN id SET DEFAULT nextval('public."Permission_id_seq"'::regclass);


--
-- Name: Role id; Type: DEFAULT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Role" ALTER COLUMN id SET DEFAULT nextval('public."Role_id_seq"'::regclass);


--
-- Name: Role_Permission id; Type: DEFAULT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Role_Permission" ALTER COLUMN id SET DEFAULT nextval('public."Role_Permission_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: Activity_log; Type: TABLE DATA; Schema: <schema>; Owner: kurvers
--

COPY "<schema>"."Activity_log" (id, "userId", action, "dateAdded", activity) FROM stdin;
2	13	login	2024-12-10 07:58:40.239	authentication
3	13	login	2024-12-10 08:04:37.059	authentication
4	13	login	2024-12-10 08:10:58.707	authentication
5	13	login	2024-12-10 08:58:19.452	authentication
6	13	login	2024-12-10 11:51:06.607	authentication
7	13	login	2024-12-11 08:34:23.912	authentication
8	13	login	2024-12-12 05:39:53.949	authentication
9	13	login	2024-12-12 05:47:49.833	authentication
10	13	login	2024-12-12 07:58:36.753	authentication
12	13	login	2024-12-12 08:05:02.3	authentication
14	13	updated	2024-12-12 08:29:38.562	Banner
15	13	login	2024-12-12 09:47:18.828	authentication
16	13	updated	2024-12-12 09:48:15.576	General Data
17	13	updated	2024-12-12 09:48:28.991	General Data
18	13	updated	2024-12-12 09:49:11.647	General Data
19	13	updated	2024-12-12 09:49:35.38	General Data
20	13	updated	2024-12-12 10:03:19.671	User
21	13	updated	2024-12-12 10:03:33.84	User
22	13	created	2024-12-12 10:06:54.925	Role
23	13	created	2024-12-12 10:06:57.368	Role
24	13	login	2024-12-12 10:07:47.25	authentication
25	13	login	2024-12-12 10:13:13.984	authentication
26	13	created	2024-12-12 10:13:24.719	Role
27	13	created	2024-12-12 10:13:25.856	Role
28	13	created	2024-12-12 10:13:26.429	Role
29	13	created	2024-12-12 10:13:26.728	Role
30	13	created	2024-12-12 10:13:27.079	Role
31	13	login	2024-12-13 07:09:56.315	authentication
32	13	updated	2024-12-13 07:10:36.672	General Data
33	13	created	2024-12-13 07:12:07.933	User
34	13	removed	2024-12-13 07:12:17.178	User
35	13	created	2024-12-13 08:25:07.158	Role
36	13	removed	2024-12-13 08:25:11.719	Role
37	13	login	2025-01-02 06:17:16.182	authentication
38	13	updated	2025-01-02 06:17:26.924	General Data
39	13	login	2025-01-02 07:37:26.033	authentication
\.


--
-- Data for Name: Banner; Type: TABLE DATA; Schema: <schema>; Owner: kurvers
--

COPY "<schema>"."Banner" (id, banner, type, title, description, "isButtonVisible", "buttonText", "buttonLink", "isDeleted", "isActive", "createdAt", "updatedAt") FROM stdin;
1	sample banner	sample type	sample	sample description	t	sampe button text	sample button lnk	t	t	2024-11-21 06:35:33.668	2024-11-21 06:42:01.929
5	sample banner	dsf	onFinish	dsfdsf	t	\N	\N	t	t	2024-11-21 06:47:53.023	2024-11-21 06:48:07.909
4	sample banner	sample type	sample	sample descriptopj	t	\N	\N	t	t	2024-11-21 06:47:37.188	2024-11-21 06:48:44.647
3	sample banner	sample type	sample	sample descriptopj	t	\N	\N	t	t	2024-11-21 06:47:13.222	2024-11-21 06:48:48.806
9	uploads\\1732179833818-34a7e141-3e4b-4640-a574-76c046a28557.jpg	asdf	title	sdes	t	\N	\N	t	t	2024-11-21 09:03:53.93	2024-11-21 09:14:26.227
2	sample banner	asd	adf	asdasd	t	\N	\N	t	t	2024-11-21 06:45:46.855	2024-11-21 09:14:29.953
6	new banner	sample type	sample title	sample description	t	\N	\N	t	t	2024-11-21 08:37:26.41	2024-11-21 09:14:33.437
7	new banner	sample type	sample title	sample description	t	\N	\N	t	t	2024-11-21 08:37:30.74	2024-11-21 09:14:36.958
8	uploads\\1732179043038-e1232e6c-0d6f-44c0-993c-8d3881c73361.png	sample type	sample title	sample description	t	\N	\N	t	t	2024-11-21 08:50:43.046	2024-11-21 09:14:40.016
10	uploads\\1732180503353-635b6cf6-2dff-4689-9d22-7becd9a5162d.png	sample type	sample title	sample description	t	\N	\N	t	t	2024-11-21 09:15:03.366	2024-11-22 12:30:39.217
11	uploads\\1732180600248-ad985f0b-6eab-4cb8-ba42-08bf0be90493.jpg	sample type	sample title	sample descriptiom	t	sample text	sampe vutotn link	t	t	2024-11-21 09:16:40.33	2024-11-22 12:30:42.187
12	uploads\\1732187482374-0d357905-0f73-43d7-a06c-266163eacf3e.jpg	sampe type 	sample title	sample descropt	t	sampl butt	button link	t	t	2024-11-21 11:11:22.449	2024-11-22 12:30:44.36
18	uploads\\1732520691962-17bc3242-c78c-466a-a56d-99e220e2b403.png	sample type	sample <span class="highlight">sample 123</span>	sample description	t	\N	\N	t	t	2024-11-25 07:44:52.042	2024-11-25 07:45:29.975
19	uploads\\1732520756208-b3cc9996-5c90-4095-b3e1-65f7f0c1c9dd.png	home	sample sample <span class="highlight">sample 123</span>	sample descriptioj	t	\N	\N	t	t	2024-11-25 07:45:56.245	2024-11-25 07:48:32.809
23	uploads\\1732521161210-372801b7-62d7-497a-b96c-7bd5c780ffc0.png	gogreen	gogreen3	sample	t	\N	\N	f	t	2024-11-25 07:52:41.215	2024-11-25 07:52:41.215
24	uploads\\1732521407765-b19cf3bf-fd88-4828-9b6f-c7be1d9cbb98.png	gogreen	gogreen4	gogreen	t	\N	\N	t	t	2024-11-25 07:56:47.775	2024-11-25 07:57:03.744
20	uploads\\1732520935487-ea425fd7-d907-40f7-9da4-c50e2622cd10.png	home	 YOUR PARTNER FOR <span class="highlight">SUCCESS</span>	sample	t	sampke ats	asdasd	t	t	2024-11-25 07:48:55.528	2024-11-25 08:42:27.778
13	uploads\\1732278986310-b475170b-8d56-494d-9438-b359aec8c352.png	home	YOUR PARTNER FOR SUCCESS	Process Piping, Offshore, Pipelines	t	Find Out More	/product	t	t	2024-11-22 12:36:26.391	2024-11-25 08:42:31.466
14	uploads\\1732280044795-6ae0f9b2-91bf-4fbb-84ce-02be4f265054.png	home	YOUR PARTNER FOR SUCCESS	Process Piping, Offshore, Pipelines	t	Find Out More	/product	t	t	2024-11-22 12:54:04.898	2024-11-25 08:42:35.15
15	uploads\\1732280233049-9a31bf87-efb8-4346-8383-e0f571a70d11.png	home	YOUR PARTNER FOR SUCCESS	Process Piping, Offshore, Pipelines	t	Find Out More	/product	t	t	2024-11-22 12:57:13.118	2024-11-25 08:42:37.823
16	uploads\\1732280322642-d033572e-2c78-44c7-b2a4-e7e4d8874c88.png	home	YOUR PARTNER FOR SUCCESS	Process Piping, Offshore, Pipelines	t	Find Out More	/product	t	t	2024-11-22 12:58:42.689	2024-11-25 08:42:40.448
17	uploads\\1732280399204-afa5b506-24e2-4977-a8cc-881b53b2a3c5.png	home	YOUR PARTNER FOR SUCCESS	Process Piping, Offshore, Pipelines	t	Find Out More	/product	t	t	2024-11-22 12:59:59.277	2024-11-25 08:42:43.484
29	uploads\\1732531599965-a922041e-11e6-45fd-a1e3-8e2f277aee37.png	home	<h1>YOUR PARTNER FOR <span style="color: rgb(0, 162, 232);">SUCCESS</span></h1>	<p>Process Piping, Offshore, Pipelines</p>	t	Find Out More	/product	f	t	2024-11-25 10:46:40.041	2024-12-10 07:40:11.653
28	uploads\\1732531487445-d5167522-3920-47ca-8dbf-c25864c7a83c.png	home	<h1>YOUR PARTNER FOR <span style="color: rgb(0, 162, 232);">SUCCESS</span></h1>	<p>Process Piping, Offshore, Pipelines</p>	t	Find Out More	/product	f	t	2024-11-25 10:44:47.482	2024-12-10 07:40:22.584
27	uploads\\1732531426076-f0bb3a2d-e3e2-4bf5-87f7-f8c9002f4565.png	home	<h1>YOUR PARTNER FOR <span style="color: rgb(0, 162, 232);">SUCCESS</span></h1>	<p>Process Piping, Offshore, Pipelines</p>	t	Find Out More	/product	f	t	2024-11-25 10:43:46.157	2024-12-10 07:44:17.934
25	uploads\\1732524319601-1ab1acff-9e16-4a33-96c7-af1c9d70b6a0.png	home	<h1>YOUR PARTNER FOR <span style="color: rgb(0, 162, 232);">SUCCESS</span></h1>	<p>Process Piping, Offshore, Pipelines</p>	t	Find Out More	/product	f	t	2024-11-25 08:45:19.695	2024-12-10 07:44:33.56
21	uploads\\1732521061956-a1e56e5e-a8dd-4da3-96fd-3823d76f6f6c.png	gogreen	<p>gogreen1</p>	<p>No Description</p>	t			f	t	2024-11-25 07:51:01.964	2024-12-12 07:59:36.953
22	uploads\\1732521140717-95926bcd-2ad5-45b3-ba12-e59ff9d473c7.png	gogreen	<p>gogreen2</p>	<p>no description</p>	t	\N	\N	f	t	2024-11-25 07:52:20.722	2024-12-12 08:29:38.569
30	uploads/1732614979894-812c3621-15d0-4c12-9e19-d2038dd5e2ad.jpg	Type 1	Title 1	Desc	t	\N	\N	t	t	2024-11-26 09:56:20.016	2024-11-26 10:07:40.263
31	uploads/1732615678480-4d003a57-6373-46a8-877b-b7e2c4c80c4c.jpg	home	home	home	t	\N	\N	t	t	2024-11-26 10:07:58.591	2024-11-26 10:09:38.164
32	uploads/1732619277864-5705f4e1-d7be-4ade-9561-aadd9bc53ddd.jpg	Home	Home	Home	t	Click here to know more	www.google.com	t	t	2024-11-26 11:07:58.002	2024-11-26 11:08:40
33	uploads/1732619345184-f7fba348-ac36-4256-a0a7-95f7de04a248.jpg	home	home	home	t	\N	\N	t	t	2024-11-26 11:09:05.308	2024-11-26 11:10:03.322
34	uploads/1732619473674-de65daf2-1263-415c-9e14-1ecd68ce613a.jpg	home	home	home	t	Click here to know more	www.google.com	t	t	2024-11-26 11:11:13.796	2024-11-26 11:11:51.007
36	uploads/1732698971566-1b5dce07-d261-4655-849a-c4a9360d9137.jpg	home	home	Welcome to KURVERS WORLD	t	CLICK HERE	/career	t	t	2024-11-27 09:16:11.765	2024-11-27 09:16:37.163
26	uploads\\1732524400478-f45f791e-92b6-446c-aba8-12dc9802dc82.png	home	<h1>YOUR PARTNER FOR <span style="color: rgb(0, 162, 232);">SUCCESS</span></h1>	<p>Process Piping, Offshore, Pipelines</p>	t	Find Out More	/product	f	t	2024-11-25 08:46:40.583	2024-12-10 07:39:13.89
35	uploads/1732620518129-b81ff685-3bae-4c0f-a5c4-677bd5e61839.jpg	sad	asd	asd	t	\N	\N	t	t	2024-11-26 11:28:39.076	2024-12-10 07:39:22.99
\.


--
-- Data for Name: Configuration; Type: TABLE DATA; Schema: <schema>; Owner: kurvers
--

COPY "<schema>"."Configuration" (id, "dateAdded", "updatedAt", label, value) FROM stdin;
21	2024-11-22 10:59:56.822	2024-11-22 11:53:20.732	footer_city	40549 Düsseldorf
20	2024-11-22 10:59:21.915	2024-11-22 11:53:29.909	footer_street	Willstätterstraße 30
19	2024-11-22 10:59:02.561	2024-11-22 11:53:38.379	footer_companyname	Horst Kürvers GmbH
17	2024-11-22 10:56:10.747	2024-11-22 11:53:47.956	linkedin_link	https://www.linkedin.com/company/lindsay-harvey
22	2024-11-22 11:00:14.299	2024-11-22 12:16:51.231	footer_country	Germany
26	2024-11-25 08:30:33.474	2024-11-25 08:30:33.474	career_apply_mail	job@kurvers.com
24	2024-11-25 08:16:42.058	2024-11-25 08:38:33.35	home_locations_count	9
25	2024-11-25 08:17:30.693	2024-11-25 08:38:39.858	home_projects_completed	3000
23	2024-11-25 08:16:20.146	2024-11-25 08:38:48.293	home_established	1966
38	2024-12-10 08:25:39.579	2024-12-12 07:18:51.825	contact_usa	{"heading":"Kurvers Inc.","email":"usa@kurvers.com","address1":"Houston, USA","address2":"","phone":""}
36	2024-12-10 08:07:58.794	2024-12-12 05:56:17.803	kurvers-valves	{"products":{"Gate valves":["Cast gate valves","Forged gate valves","Pipeline gate valve API 6D"],"Butterfly valves":["Concentric butterfly valves","Double off-set butterfly valves","Riple off-set butterfly valves"],"Check valves":["Check valves, cast/forged","Swing check valves, cast/forged","Check valves wafer-type","Swing check valves wafer-type"],"Strainers":["Strainer Y-Form","Pot strainer"],"Ball valves":["One-pc floating ball valves","Two-pc floating ball valves","Three-pc floating ball valves","Soft sealing","Metallic sealing","Top entry","Fully welded","3-way ball valves"],"Globe valves":["Cast gate valves","Forged gate valves","3-way globe valves","Y-type globe valves","Quick closing globe valves"],"Special valves":["Piggable valves","Nozzle check valves","Safety valves","Sight glasses","Steam traps","Mud valves"],"Drives":["Electric","Hydraulic","Pneumatic","Gas over oil"],"Test Valves":["Test"]}}
16	2024-11-22 10:54:53.707	2024-12-10 08:01:53.784	mail	germany@kurvers.com
15	2024-11-22 10:54:24.949	2024-12-12 09:48:15.584	central_fax_no	+49 211 95 95 95 66
14	2024-11-22 10:53:37.323	2024-12-12 09:48:28.996	central_tel_no	+49 211 95 95 95 0
39	2024-12-10 08:26:26.492	2024-12-10 08:26:26.492	contact_ger	{"heading":"Horst Kürvers GmbH","email":"germany@kurvers.com","address1":"Willstätterstraße 30, 40549 Düsseldorf, Germany","address2":"","phone":"+492119595950"}
41	2024-12-10 08:27:33.312	2024-12-10 08:27:33.312	contact_italy	{"heading":"Kurvers Piping Italy Srl","email":"italy@kurvers.com","address1":"Via F.lli Calvi 2, 24122 Bergamo, Italy","address2":"","phone":""}
42	2024-12-10 08:28:12.697	2024-12-10 08:28:12.697	contact_uk	{"heading":"Kurvers International Supply Services Ltd.","email":"uk@kurvers.com","address1":"Floor 4, No1 Poultry","address2":"London, EC2R 8EJ, UK","phone":""}
43	2024-12-10 08:29:05.215	2024-12-10 08:29:05.215	contact_france	{"heading":"Kürvers France Sarl 70","email":"france@kurvers.com","address1":"Galerie Vivienne, 75002 Paris, France","address2":"","phone":""}
44	2024-12-10 08:30:10.363	2024-12-10 08:30:10.363	contact_china	{"heading":"Kurvers Piping China Ltd.","email":"china@kurvers.com","address1":"504, No.3 Bldg., Zhengrong Center","address2":"666 Shenhong Rd, Shanghai, PR China","phone":""}
45	2024-12-10 08:30:50.787	2024-12-10 08:30:50.787	contact_sing	{"heading":"Kurvers Singapore Pte. Ltd.","email":"singapore@kurvers.com","address1":"100, Tras Street #16 01, Singapore 079027","address2":"","phone":""}
46	2024-12-10 08:31:30.172	2024-12-10 08:31:30.172	contact_uae	{"heading":"Kurvers Piping Middle East FZCO","email":"uae@kurvers.com","address1":"BCB 2, Office 424, Dubai CommerCity","address2":"P.O.Box – 35051 Umm Ramool, Dubai, United Arab Emirates","phone":""}
40	2024-12-10 08:27:08.161	2024-12-13 07:10:36.676	contact_ner	{"heading":"Netherlands Kürvers Piping BV","email":"netherlands@kurvers.com","address1":"P.O. Box 494 2900 AL Capelle aan den IJssel","address2":"Rietbaan 2-4 2908 LP Capelle aan den IJssel, The Netherlands","phone":""}
18	2024-11-22 10:57:31.402	2025-01-02 06:17:26.928	copyright	Copyright © 2025 Kürvers | Website by Strategy Kings
37	2024-12-10 08:09:03.99	2024-12-12 06:33:55.66	product-range	{"heading":"Product Range","description":"Kürvers can supply both standard materials from stock or, where required, we can arrange for materials to be manufactured strictly in accordance with your project's individual needs.","products":{"Pipes":["Seamless and welded carbon steel linepipe to API, EN and ISO specifications","Seamless and welded carbon, alloy, stainless and duplex steel pipes for high and low temperature service to ASTM, ASME, API, EN, ISO and AWWA specifications","Casing and tubing","CRA clad pipes","Boiler, heat-exchanger and precision tubes","Welded steel pipes with larger diameters (16\\"-144\\") and exceptionally heavy wall thicknesses","Welded structural tubulars for offshore applications","Pipes made from Monel, Hastelloy, Incoloy and Titanium Alloys, Cuni"],"Plates, Beams and Profiles":["Carbon, alloy and stainless steel plates","Structural sections"],"Fittings, Flanges, Gaskets, Bolts, Nuts, Weld Consumables":["Seamless and welded BW and forged fittings in carbon, alloy, stainless and duplex steels to ASTM, ASME and EN specifications","Flanges in carbon alloy, stainless and duplex steels to ASTM, ASME and EN specifications","Fittings, flanges and piping items to client drawings with supporting calculations","Metallic and non-metallic gaskets","Stud bolts, machine bolts, nuts and washers in metric or imperial sizes","Welding consumables including rods and fluxes","Insulation materials and repair kits"],"Valves, Strainers, Traps":"https://projects.puremagicit.com/kurvers/valves"}}
\.


--
-- Data for Name: Job; Type: TABLE DATA; Schema: <schema>; Owner: kurvers
--

COPY "<schema>"."Job" (title, location, type, description, "dateAdded", "updatedAt", "isDeleted", "isActive", responsibilities, requirements, id) FROM stdin;
sample title	sample location	sample type	sample description	2024-11-20 11:29:07.369	2024-11-20 11:48:04.551	t	t	{"sample resp2","sample resp4"}	{"sample req1","sample resp2","orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu"}	2
sample	sample location	sample type	sample description	2024-11-20 09:43:21.585	2024-11-20 11:28:12.817	t	t	{"sample resp","sample resp2"}	{"\tsample re",safaasf,asfasf,"sample agaoin"}	1
QA	Dubai	career	career	2024-11-26 10:13:19.542	2024-11-26 11:17:02.365	t	t	{"Manual Tester"}	{Graduation}	4
QA	Dubai	Permanent	Quality assurance (QA) engineers design and develop the QA management systems and tools of an organization. They define test requirements and automate test procedures to help create and maintain an exceptional user experience. They often work in manufacturing or technology companies.	2024-11-27 09:18:19.976	2024-11-27 10:35:29.402	t	t	{"Quality assurance (QA) engineers design and develop the QA management systems and tools of an organization. They define test requirements and automate test procedures to help create and maintain an exceptional user experience. They often work in manufacturing or technology companies."}	{Graduated,"QA Certified"}	5
Accountant	Dubai	Permanent	We are looking for an accountant who is responsible for maintaining accurate financial records and preparing associated reporting. The role is to support the organisation by ensuring that all financial records and reporting are up to standard, updated and maintained regularly.	2024-11-20 11:46:31.62	2024-12-11 08:37:31.507	f	t	{"Ensure the timely and accurate preparation of monthly, Quarterly and annual reports","Evaluate and review monthly financial statements, results of operations, income statements and financial records.","Manage all accounting transactions and maintain general ledger","Preparation and monitoring budgets","Management and Financial Reporting","Appropriate recording and analysis of revenues and expenses","Appropriate coordination and communication with the relevant customers, suppliers, and Sales personal to ensure accuracy of information","Assisting with external audit activities","Providing process and control improvements when required"}	{"Must have a degree in Finance or Accounting related qualifications","Thorough knowledge and experience on working with a reputed ERP system","At least 3 years’ experience ideally in a multinational company.","Must be familiar with the UAE regulatory and tax compliance","Knowledge of Trade Finance","Excellent written and verbal communication skills","Knowledge of International Trade","Knowledge of Bank Guarantees, Letter of Credit & Exchange Hedging"}	3
\.


--
-- Data for Name: JobApply; Type: TABLE DATA; Schema: <schema>; Owner: kurvers
--

COPY "<schema>"."JobApply" (id, name, email, phone, "coverLetter", resume, "appliedAt", "jobId") FROM stdin;
13	Vidhi	vidhi@toshalinfotech.com	7796737750	uploads/1733992935261-36e836d1-4c8b-49b8-9205-2e01fa7a70db.docx	uploads/1733992935260-a0b18f1f-a783-46a5-ab74-f1c59c6acb9f.docx	2024-12-12 08:42:15.266	3
\.


--
-- Data for Name: Permission; Type: TABLE DATA; Schema: <schema>; Owner: kurvers
--

COPY "<schema>"."Permission" (id, "PermissionName") FROM stdin;
1	job_application
2	banner
3	career
4	configuration
5	admin
6	product_range
7	kurvers_valves
8	contact_us
9	Test Permission
\.


--
-- Data for Name: Role; Type: TABLE DATA; Schema: <schema>; Owner: kurvers
--

COPY "<schema>"."Role" (id, "RoleName", "dateAdded", "isDeleted") FROM stdin;
2	ADMIN	2024-11-20 05:56:13.955	f
3	Test Role	2024-11-27 09:09:50.631	t
4	CMS & Career	2024-12-06 13:06:09.229	f
8	Sample Role	2024-12-12 07:20:46.747	f
16	Test role	2024-12-13 08:25:07.163	t
\.


--
-- Data for Name: Role_Permission; Type: TABLE DATA; Schema: <schema>; Owner: kurvers
--

COPY "<schema>"."Role_Permission" (id, "roleId", "permissionId", type) FROM stdin;
1	2	1	READ
2	2	1	WRITE
3	2	1	DELETE
4	2	1	UPDATE
5	2	3	WRITE
6	2	4	READ
7	2	3	READ
8	2	4	UPDATE
9	2	3	UPDATE
10	2	4	DELETE
11	2	3	DELETE
12	2	4	WRITE
13	2	2	READ
14	2	2	WRITE
15	2	2	DELETE
16	2	2	UPDATE
17	2	5	READ
18	2	5	WRITE
19	2	5	DELETE
20	2	5	UPDATE
21	4	1	READ
22	4	1	WRITE
23	4	1	DELETE
24	4	1	UPDATE
25	4	3	WRITE
26	4	3	DELETE
27	4	3	READ
28	4	4	WRITE
29	4	4	DELETE
30	4	3	UPDATE
31	4	4	READ
32	4	4	UPDATE
33	4	2	WRITE
34	4	2	UPDATE
35	4	2	READ
36	4	2	DELETE
37	2	7	WRITE
38	2	8	READ
39	2	7	READ
40	2	8	UPDATE
41	2	7	UPDATE
42	2	7	DELETE
43	2	8	DELETE
44	2	8	WRITE
45	2	6	WRITE
46	2	6	READ
47	2	6	DELETE
48	2	6	UPDATE
49	4	5	WRITE
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: <schema>; Owner: kurvers
--

COPY "<schema>"."User" (id, name, email, password, "roleId", "dateAdded", "lastLogin", "isActive", "profileImage", "updatedAt", "isDeleted") FROM stdin;
20	Vdih	adming@gmail.com	12345	2	2024-11-28 12:57:39.934	\N	t	\N	2024-12-11 08:41:11.017	t
19	Vidhi	test@gmail.com	sample	2	2024-11-27 09:08:33.583	\N	t	\N	2024-11-27 09:09:38.14	t
22	sample	devops@itspuremagic.me	root	8	2024-12-12 07:21:16.214	\N	t	\N	2024-12-12 07:59:13.181	f
21	Kiara 123	kiara123@gmail.com	root1	8	2024-12-11 08:39:48.028	\N	t	\N	2024-12-12 10:03:33.844	f
14	ewr	wer@dsf.cm	qwer	2	2024-11-20 08:53:33.935	\N	t	\N	2024-11-28 12:36:45.862	t
23	Fadhil	admin@gmail1.com	root	4	2024-12-13 07:12:07.938	\N	t	\N	2024-12-13 07:12:17.181	t
13	Site Admin	admin@gmail.com	root	2	2024-11-20 06:52:50.033	2025-01-02 07:37:26.026	t	\N	2025-01-02 07:37:26.027	f
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: <schema>; Owner: kurvers
--

COPY "<schema>"._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
7437e58b-40d0-4749-9225-04749f053923	e1f8b8adcc8fdb29c429ad7439f6259eb1aec0b80d7e52c647ec80afdc1ccc54	2024-11-15 11:21:41.001367+00	20241115112140_init	\N	\N	2024-11-15 11:21:40.990303+00	1
88968b6d-e640-4d22-9b5a-5b2d8dfad1c5	9467bdcc24ec5dd29e9c36529e607359bcc1e2ef6d3c7b1570e323a00b75c582	2024-11-15 11:26:45.519285+00	20241115112645_change	\N	\N	2024-11-15 11:26:45.514931+00	1
ae657b04-c756-48a8-a2f6-14dc3407e4ec	94a91ba6b6defa1b3938086287e4c1393b7455181156a64b0938b742d7ca6587	2024-11-18 07:03:54.603698+00	20241118070354_users	\N	\N	2024-11-18 07:03:54.583747+00	1
e8412df6-388c-472c-bd15-38b97623ce6c	320858adf2bad65cf9cdd0889912e3374e81ecc12470f40427ec9e80e350cc62	2024-11-18 13:37:33.979789+00	20241118133733_deleteoption	\N	\N	2024-11-18 13:37:33.975339+00	1
8b694d96-8f57-43ad-af28-d384f5700791	a68fec3608497267484c3b662c773b9f9ff073f1cb1563c1505c2e24da015c51	2024-11-20 05:52:54.102547+00	20241120055254_firstlongupdate	\N	\N	2024-11-20 05:52:54.069653+00	1
51c58579-0ce0-49f6-aaea-7e82749d9c59	92b82081c87772731e2d341435c71462f4904f05e3998f201d1e9c1352d0b545	2024-11-20 08:26:24.733562+00	20241120082624_jobidchange	\N	\N	2024-11-20 08:26:24.721288+00	1
50fa5546-6291-45d3-93e8-5fcdd2bb2d4f	a48928597b07b0a6d78145403f39b1e829fe9723b20c4aa017589260ef116f9c	2024-11-20 12:46:45.494406+00	20241120124645_tableforjobapplications	\N	\N	2024-11-20 12:46:45.482251+00	1
c19780d2-5ae3-462b-9fb1-f0b558908003	1b532f318aac9881fcde5b514561d44e62598080c72b4ecb9cbcd2d26af60ec2	2024-11-21 06:03:05.695755+00	20241121060305_bannertableadded	\N	\N	2024-11-21 06:03:05.686928+00	1
4aa5b4b8-5ba1-40d8-a828-7e6cb39c689d	99178c66dce9894cb824aeb953648648b77123718cdaaac00c3585163ae2716d	2024-12-10 07:52:17.925493+00	20241209091116_activity_tab_logged	\N	\N	2024-12-10 07:52:17.868962+00	1
\.


--
-- Data for Name: Activity; Type: TABLE DATA; Schema: public; Owner: kurvers
--

COPY public."Activity" (id, name) FROM stdin;
\.


--
-- Data for Name: Activity_log; Type: TABLE DATA; Schema: public; Owner: kurvers
--

COPY public."Activity_log" (id, "activityId", "userId", action, "dateAdded") FROM stdin;
\.


--
-- Data for Name: Banner; Type: TABLE DATA; Schema: public; Owner: kurvers
--

COPY public."Banner" (id, banner, type, title, description, "isButtonVisible", "buttonText", "buttonLink", "isDeleted", "isActive", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Configuration; Type: TABLE DATA; Schema: public; Owner: kurvers
--

COPY public."Configuration" (id, "dateAdded", "updatedAt", label, value) FROM stdin;
\.


--
-- Data for Name: Job; Type: TABLE DATA; Schema: public; Owner: kurvers
--

COPY public."Job" (title, location, type, description, "dateAdded", "updatedAt", "isDeleted", "isActive", responsibilities, requirements, id) FROM stdin;
\.


--
-- Data for Name: JobApply; Type: TABLE DATA; Schema: public; Owner: kurvers
--

COPY public."JobApply" (id, name, email, phone, "coverLetter", resume, "appliedAt", "jobId") FROM stdin;
\.


--
-- Data for Name: Permission; Type: TABLE DATA; Schema: public; Owner: kurvers
--

COPY public."Permission" (id, "PermissionName") FROM stdin;
\.


--
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: kurvers
--

COPY public."Role" (id, "RoleName", "dateAdded", "isDeleted") FROM stdin;
\.


--
-- Data for Name: Role_Permission; Type: TABLE DATA; Schema: public; Owner: kurvers
--

COPY public."Role_Permission" (id, "roleId", "permissionId", type) FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: kurvers
--

COPY public."User" (id, name, email, password, "roleId", "dateAdded", "lastLogin", "isActive", "profileImage", "updatedAt", "isDeleted") FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: kurvers
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
f8c1b9f8-4fff-4474-8a80-12db4ce057ed	e1f8b8adcc8fdb29c429ad7439f6259eb1aec0b80d7e52c647ec80afdc1ccc54	2024-11-26 13:51:40.675516+00	20241115112140_init	\N	\N	2024-11-26 13:51:40.654148+00	1
9a68688e-7fd4-4e48-af93-3a54554db6f2	9467bdcc24ec5dd29e9c36529e607359bcc1e2ef6d3c7b1570e323a00b75c582	2024-11-26 13:51:40.681645+00	20241115112645_change	\N	\N	2024-11-26 13:51:40.676976+00	1
ed06f814-7ddb-49d0-88fd-92b43c040da0	94a91ba6b6defa1b3938086287e4c1393b7455181156a64b0938b742d7ca6587	2024-11-26 13:51:40.710774+00	20241118070354_users	\N	\N	2024-11-26 13:51:40.68311+00	1
3c3d427a-3f7f-4ecc-8df1-62466e90c6a8	320858adf2bad65cf9cdd0889912e3374e81ecc12470f40427ec9e80e350cc62	2024-11-26 13:51:40.716568+00	20241118133733_deleteoption	\N	\N	2024-11-26 13:51:40.712162+00	1
21b1990b-a99d-410d-9830-5d040b0287dd	a68fec3608497267484c3b662c773b9f9ff073f1cb1563c1505c2e24da015c51	2024-11-26 13:51:40.775311+00	20241120055254_firstlongupdate	\N	\N	2024-11-26 13:51:40.717893+00	1
c82dccfa-8569-4854-ba7e-a5f475e64f50	92b82081c87772731e2d341435c71462f4904f05e3998f201d1e9c1352d0b545	2024-11-26 13:51:40.790714+00	20241120082624_jobidchange	\N	\N	2024-11-26 13:51:40.777012+00	1
7f1a308f-dccf-47a2-8c39-93ff33b0d87a	a48928597b07b0a6d78145403f39b1e829fe9723b20c4aa017589260ef116f9c	2024-11-26 13:51:40.805387+00	20241120124645_tableforjobapplications	\N	\N	2024-11-26 13:51:40.792546+00	1
01654ba1-64eb-4e75-ae66-3343d6646483	1b532f318aac9881fcde5b514561d44e62598080c72b4ecb9cbcd2d26af60ec2	2024-11-26 13:51:40.819685+00	20241121060305_bannertableadded	\N	\N	2024-11-26 13:51:40.80714+00	1
\.


--
-- Name: Activity_log_id_seq; Type: SEQUENCE SET; Schema: <schema>; Owner: kurvers
--

SELECT pg_catalog.setval('"<schema>"."Activity_log_id_seq"', 39, true);


--
-- Name: Banner_id_seq; Type: SEQUENCE SET; Schema: <schema>; Owner: kurvers
--

SELECT pg_catalog.setval('"<schema>"."Banner_id_seq"', 36, true);


--
-- Name: Configuration_id_seq; Type: SEQUENCE SET; Schema: <schema>; Owner: kurvers
--

SELECT pg_catalog.setval('"<schema>"."Configuration_id_seq"', 46, true);


--
-- Name: JobApply_id_seq; Type: SEQUENCE SET; Schema: <schema>; Owner: kurvers
--

SELECT pg_catalog.setval('"<schema>"."JobApply_id_seq"', 13, true);


--
-- Name: Job_id_seq; Type: SEQUENCE SET; Schema: <schema>; Owner: kurvers
--

SELECT pg_catalog.setval('"<schema>"."Job_id_seq"', 5, true);


--
-- Name: Permission_id_seq; Type: SEQUENCE SET; Schema: <schema>; Owner: kurvers
--

SELECT pg_catalog.setval('"<schema>"."Permission_id_seq"', 9, true);


--
-- Name: Role_Permission_id_seq; Type: SEQUENCE SET; Schema: <schema>; Owner: kurvers
--

SELECT pg_catalog.setval('"<schema>"."Role_Permission_id_seq"', 49, true);


--
-- Name: Role_id_seq; Type: SEQUENCE SET; Schema: <schema>; Owner: kurvers
--

SELECT pg_catalog.setval('"<schema>"."Role_id_seq"', 16, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: <schema>; Owner: kurvers
--

SELECT pg_catalog.setval('"<schema>"."User_id_seq"', 23, true);


--
-- Name: Activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kurvers
--

SELECT pg_catalog.setval('public."Activity_id_seq"', 1, false);


--
-- Name: Activity_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kurvers
--

SELECT pg_catalog.setval('public."Activity_log_id_seq"', 1, false);


--
-- Name: Banner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kurvers
--

SELECT pg_catalog.setval('public."Banner_id_seq"', 1, false);


--
-- Name: Configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kurvers
--

SELECT pg_catalog.setval('public."Configuration_id_seq"', 1, false);


--
-- Name: JobApply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kurvers
--

SELECT pg_catalog.setval('public."JobApply_id_seq"', 1, false);


--
-- Name: Job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kurvers
--

SELECT pg_catalog.setval('public."Job_id_seq"', 1, false);


--
-- Name: Permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kurvers
--

SELECT pg_catalog.setval('public."Permission_id_seq"', 1, false);


--
-- Name: Role_Permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kurvers
--

SELECT pg_catalog.setval('public."Role_Permission_id_seq"', 1, false);


--
-- Name: Role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kurvers
--

SELECT pg_catalog.setval('public."Role_id_seq"', 1, false);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kurvers
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, false);


--
-- Name: Activity_log Activity_log_pkey; Type: CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Activity_log"
    ADD CONSTRAINT "Activity_log_pkey" PRIMARY KEY (id);


--
-- Name: Banner Banner_pkey; Type: CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Banner"
    ADD CONSTRAINT "Banner_pkey" PRIMARY KEY (id);


--
-- Name: Configuration Configuration_pkey; Type: CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Configuration"
    ADD CONSTRAINT "Configuration_pkey" PRIMARY KEY (id);


--
-- Name: JobApply JobApply_pkey; Type: CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."JobApply"
    ADD CONSTRAINT "JobApply_pkey" PRIMARY KEY (id);


--
-- Name: Job Job_pkey; Type: CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Job"
    ADD CONSTRAINT "Job_pkey" PRIMARY KEY (id);


--
-- Name: Permission Permission_pkey; Type: CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Permission"
    ADD CONSTRAINT "Permission_pkey" PRIMARY KEY (id);


--
-- Name: Role_Permission Role_Permission_pkey; Type: CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Role_Permission"
    ADD CONSTRAINT "Role_Permission_pkey" PRIMARY KEY (id);


--
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Activity_log Activity_log_pkey; Type: CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Activity_log"
    ADD CONSTRAINT "Activity_log_pkey" PRIMARY KEY (id);


--
-- Name: Activity Activity_pkey; Type: CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Activity"
    ADD CONSTRAINT "Activity_pkey" PRIMARY KEY (id);


--
-- Name: Banner Banner_pkey; Type: CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Banner"
    ADD CONSTRAINT "Banner_pkey" PRIMARY KEY (id);


--
-- Name: Configuration Configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Configuration"
    ADD CONSTRAINT "Configuration_pkey" PRIMARY KEY (id);


--
-- Name: JobApply JobApply_pkey; Type: CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."JobApply"
    ADD CONSTRAINT "JobApply_pkey" PRIMARY KEY (id);


--
-- Name: Job Job_pkey; Type: CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Job"
    ADD CONSTRAINT "Job_pkey" PRIMARY KEY (id);


--
-- Name: Permission Permission_pkey; Type: CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Permission"
    ADD CONSTRAINT "Permission_pkey" PRIMARY KEY (id);


--
-- Name: Role_Permission Role_Permission_pkey; Type: CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Role_Permission"
    ADD CONSTRAINT "Role_Permission_pkey" PRIMARY KEY (id);


--
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Configuration_label_key; Type: INDEX; Schema: <schema>; Owner: kurvers
--

CREATE UNIQUE INDEX "Configuration_label_key" ON "<schema>"."Configuration" USING btree (label);


--
-- Name: Permission_PermissionName_key; Type: INDEX; Schema: <schema>; Owner: kurvers
--

CREATE UNIQUE INDEX "Permission_PermissionName_key" ON "<schema>"."Permission" USING btree ("PermissionName");


--
-- Name: Role_RoleName_key; Type: INDEX; Schema: <schema>; Owner: kurvers
--

CREATE UNIQUE INDEX "Role_RoleName_key" ON "<schema>"."Role" USING btree ("RoleName");


--
-- Name: User_email_key; Type: INDEX; Schema: <schema>; Owner: kurvers
--

CREATE UNIQUE INDEX "User_email_key" ON "<schema>"."User" USING btree (email);


--
-- Name: Configuration_label_key; Type: INDEX; Schema: public; Owner: kurvers
--

CREATE UNIQUE INDEX "Configuration_label_key" ON public."Configuration" USING btree (label);


--
-- Name: Permission_PermissionName_key; Type: INDEX; Schema: public; Owner: kurvers
--

CREATE UNIQUE INDEX "Permission_PermissionName_key" ON public."Permission" USING btree ("PermissionName");


--
-- Name: Role_RoleName_key; Type: INDEX; Schema: public; Owner: kurvers
--

CREATE UNIQUE INDEX "Role_RoleName_key" ON public."Role" USING btree ("RoleName");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: kurvers
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: Activity_log Activity_log_userId_fkey; Type: FK CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Activity_log"
    ADD CONSTRAINT "Activity_log_userId_fkey" FOREIGN KEY ("userId") REFERENCES "<schema>"."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: JobApply JobApply_jobId_fkey; Type: FK CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."JobApply"
    ADD CONSTRAINT "JobApply_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "<schema>"."Job"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Role_Permission Role_Permission_permissionId_fkey; Type: FK CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Role_Permission"
    ADD CONSTRAINT "Role_Permission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES "<schema>"."Permission"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Role_Permission Role_Permission_roleId_fkey; Type: FK CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."Role_Permission"
    ADD CONSTRAINT "Role_Permission_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "<schema>"."Role"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: User User_roleId_fkey; Type: FK CONSTRAINT; Schema: <schema>; Owner: kurvers
--

ALTER TABLE ONLY "<schema>"."User"
    ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "<schema>"."Role"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Activity_log Activity_log_activityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Activity_log"
    ADD CONSTRAINT "Activity_log_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES public."Activity"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Activity_log Activity_log_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Activity_log"
    ADD CONSTRAINT "Activity_log_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: JobApply JobApply_jobId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."JobApply"
    ADD CONSTRAINT "JobApply_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES public."Job"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Role_Permission Role_Permission_permissionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Role_Permission"
    ADD CONSTRAINT "Role_Permission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES public."Permission"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Role_Permission Role_Permission_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."Role_Permission"
    ADD CONSTRAINT "Role_Permission_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: User User_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kurvers
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

