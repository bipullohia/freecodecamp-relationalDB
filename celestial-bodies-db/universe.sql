--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: famous_asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.famous_asteroids (
    famous_asteroids_id integer NOT NULL,
    description character varying(200),
    story text,
    prob_of_hitting_earth numeric(2,2),
    name character varying(60) NOT NULL
);


ALTER TABLE public.famous_asteroids OWNER TO freecodecamp;

--
-- Name: famous_asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.famous_asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.famous_asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: famous_asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.famous_asteroids_asteroid_id_seq OWNED BY public.famous_asteroids.famous_asteroids_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    dist_from_earth_mly integer,
    has_life boolean,
    age_in_millionyrs integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    dist_from_earth_mly integer,
    has_life boolean,
    age_in_millionyrs integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    dist_from_earth_mly integer,
    has_life boolean,
    age_in_millionyrs integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    dist_from_earth_mly integer,
    has_life boolean,
    age_in_millionyrs integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: famous_asteroids famous_asteroids_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.famous_asteroids ALTER COLUMN famous_asteroids_id SET DEFAULT nextval('public.famous_asteroids_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: famous_asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.famous_asteroids VALUES (1, 'colost', 'near mars', 0.40, 'huge size');
INSERT INTO public.famous_asteroids VALUES (2, 'tempei', 'near jupiter', 0.10, 'in the asteroid belt');
INSERT INTO public.famous_asteroids VALUES (3, 'susi', 'near venus', 0.33, 'passing asteroid');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andrometa', 3, true, 2000);
INSERT INTO public.galaxy VALUES (2, 'superdorn', 4, false, 3566);
INSERT INTO public.galaxy VALUES (3, 'creesmodire', 4, false, 2700);
INSERT INTO public.galaxy VALUES (4, 'potnuckaire', 7, true, 1988);
INSERT INTO public.galaxy VALUES (5, 'solotol', 8, false, 3444);
INSERT INTO public.galaxy VALUES (6, 'markum', 22, true, 1390);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (23, 'alexum-moon1', 3, 3, false, 2003);
INSERT INTO public.moon VALUES (24, 'mactire-moon1', 4, 3, false, 2024);
INSERT INTO public.moon VALUES (25, 'mactire-moon2', 4, 3, false, 2024);
INSERT INTO public.moon VALUES (26, 'tok-moon1', 5, 4, false, 3446);
INSERT INTO public.moon VALUES (27, 'tok-moon2', 5, 4, false, 3446);
INSERT INTO public.moon VALUES (28, 'xum-moon1', 6, 4, false, 2006);
INSERT INTO public.moon VALUES (29, 'xum-moon2', 6, 4, false, 2006);
INSERT INTO public.moon VALUES (30, 'xum-moon3', 6, 4, false, 2006);
INSERT INTO public.moon VALUES (31, 'xum-moon4', 6, 4, true, 2006);
INSERT INTO public.moon VALUES (32, 'xum-moon5', 6, 4, false, 2006);
INSERT INTO public.moon VALUES (33, 'xum-moon6', 6, 4, false, 2006);
INSERT INTO public.moon VALUES (34, 'xum-moom7', 6, 4, false, 2006);
INSERT INTO public.moon VALUES (35, 'retu-moon1', 7, 4, false, 2710);
INSERT INTO public.moon VALUES (36, 'Oppotur-moon1', 8, 4, false, 2802);
INSERT INTO public.moon VALUES (37, 'tuck-moon1', 9, 7, true, 1999);
INSERT INTO public.moon VALUES (38, 'Zumarene-moon1', 10, 7, true, 2001);
INSERT INTO public.moon VALUES (39, 'mire-moon1', 11, 8, false, 3544);
INSERT INTO public.moon VALUES (40, 'Retro-moon1', 12, 8, false, 3511);
INSERT INTO public.moon VALUES (41, 'tutom-moon1', 13, 22, false, 1393);
INSERT INTO public.moon VALUES (42, 'stundip-moon1', 14, 22, false, 1402);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'alexum', 1, 3, true, 2003);
INSERT INTO public.planet VALUES (4, 'mactire', 1, 3, false, 2024);
INSERT INTO public.planet VALUES (5, 'tok', 2, 4, false, 3446);
INSERT INTO public.planet VALUES (6, 'xumere', 2, 4, false, 2006);
INSERT INTO public.planet VALUES (7, 'retu', 3, 4, false, 2710);
INSERT INTO public.planet VALUES (8, 'Oppotur', 3, 4, false, 2802);
INSERT INTO public.planet VALUES (9, 'tuck', 4, 7, true, 1999);
INSERT INTO public.planet VALUES (10, 'Zumarene', 4, 7, true, 2001);
INSERT INTO public.planet VALUES (11, 'mire', 5, 8, false, 3544);
INSERT INTO public.planet VALUES (12, 'Retro', 5, 8, false, 3511);
INSERT INTO public.planet VALUES (13, 'tutom', 6, 22, true, 1393);
INSERT INTO public.planet VALUES (14, 'stundip', 6, 22, false, 1402);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'cremsel', 1, 3, true, 2000);
INSERT INTO public.star VALUES (2, 'tokor', 2, 4, false, 3566);
INSERT INTO public.star VALUES (3, 'modire', 3, 4, false, 2700);
INSERT INTO public.star VALUES (4, 'tuckaire', 4, 7, true, 1988);
INSERT INTO public.star VALUES (5, 'solomire', 5, 8, false, 3444);
INSERT INTO public.star VALUES (6, 'martum', 6, 22, true, 1390);


--
-- Name: famous_asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.famous_asteroids_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 42, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: famous_asteroids famous_asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.famous_asteroids
    ADD CONSTRAINT famous_asteroids_name_key UNIQUE (name);


--
-- Name: famous_asteroids famous_asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.famous_asteroids
    ADD CONSTRAINT famous_asteroids_pkey PRIMARY KEY (famous_asteroids_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

