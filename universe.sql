--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    galaxy_type text
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
    name character varying NOT NULL,
    planet_id integer,
    distance_from_planet integer,
    is_spherical boolean
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
-- Name: moon_with_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_with_planet (
    name character varying NOT NULL,
    planet_name character varying,
    is_spherical boolean NOT NULL,
    distance_from_planet integer NOT NULL,
    moon_with_planet_id integer NOT NULL
);


ALTER TABLE public.moon_with_planet OWNER TO freecodecamp;

--
-- Name: moon_with_planet_moon_with_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_with_planet_moon_with_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_with_planet_moon_with_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_with_planet_moon_with_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_with_planet_moon_with_planet_id_seq OWNED BY public.moon_with_planet.moon_with_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    has_moon boolean NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth integer NOT NULL
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
    name character varying NOT NULL,
    galaxy_id integer,
    has_planet boolean NOT NULL,
    distance_from_earth integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_with_planet moon_with_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_with_planet ALTER COLUMN moon_with_planet_id SET DEFAULT nextval('public.moon_with_planet_moon_with_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1360, 100000, 'barred spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1010, 253700, 'barred spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1500, 273000, 'spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 400, 23000000, 'spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 9000, 29300000, 'lenticular');
INSERT INTO public.galaxy VALUES (6, 'Cigar', 8000, 12000000, 'irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 238855, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 3700, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12430, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 261000, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 414000, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 665000, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 1168000, true);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 759200, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 147900, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 4, 115250, true);
INSERT INTO public.moon VALUES (11, 'Triton', 5, 220414, true);
INSERT INTO public.moon VALUES (12, 'Charon', 10, 12180, true);
INSERT INTO public.moon VALUES (13, 'Miranda', 9, 81500, true);
INSERT INTO public.moon VALUES (14, 'Dione', 4, 234500, true);
INSERT INTO public.moon VALUES (15, 'Iapetus', 4, 2213500, false);
INSERT INTO public.moon VALUES (16, 'Rhea', 4, 327500, true);
INSERT INTO public.moon VALUES (17, 'Ariel', 9, 118000, true);
INSERT INTO public.moon VALUES (18, 'Hyperion', 4, 920000, false);
INSERT INTO public.moon VALUES (19, 'Oberon', 9, 365000, true);
INSERT INTO public.moon VALUES (20, 'Pandora', 4, 147860, false);


--
-- Data for Name: moon_with_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_with_planet VALUES ('Moon', 'Earth', true, 238855, 1);
INSERT INTO public.moon_with_planet VALUES ('Phobos', 'Mars', false, 3700, 2);
INSERT INTO public.moon_with_planet VALUES ('Deimos', 'Mars', false, 12430, 3);
INSERT INTO public.moon_with_planet VALUES ('Io', 'Jupiter', true, 261000, 4);
INSERT INTO public.moon_with_planet VALUES ('Europa', 'Jupiter', true, 414000, 5);
INSERT INTO public.moon_with_planet VALUES ('Ganymede', 'Jupiter', true, 665000, 6);
INSERT INTO public.moon_with_planet VALUES ('Callisto', 'Jupiter', true, 1168000, 7);
INSERT INTO public.moon_with_planet VALUES ('Titan', 'Saturn', true, 759200, 8);
INSERT INTO public.moon_with_planet VALUES ('Enceladus', 'Saturn', true, 147900, 9);
INSERT INTO public.moon_with_planet VALUES ('Mimas', 'Saturn', true, 115250, 10);
INSERT INTO public.moon_with_planet VALUES ('Triton', 'Neptune', true, 220414, 11);
INSERT INTO public.moon_with_planet VALUES ('Charon', 'Pluto', true, 12180, 12);
INSERT INTO public.moon_with_planet VALUES ('Miranda', 'uranus', true, 81500, 13);
INSERT INTO public.moon_with_planet VALUES ('Dione', 'Saturn', true, 234500, 14);
INSERT INTO public.moon_with_planet VALUES ('Iapetus', 'Saturn', false, 2213500, 15);
INSERT INTO public.moon_with_planet VALUES ('Rhea', 'Saturn', true, 327500, 16);
INSERT INTO public.moon_with_planet VALUES ('Ariel', 'uranus', true, 118000, 17);
INSERT INTO public.moon_with_planet VALUES ('Hyperion', 'Saturn', false, 920000, 18);
INSERT INTO public.moon_with_planet VALUES ('Oberon', 'uranus', true, 365000, 19);
INSERT INTO public.moon_with_planet VALUES ('Pandora', 'Saturn', false, 147860, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 7, true, true, 0);
INSERT INTO public.planet VALUES (2, 'Mars', 7, true, false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 7, true, false, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 7, true, true, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 7, true, false, 1);
INSERT INTO public.planet VALUES (6, 'Glise 581c', 4, true, false, 20);
INSERT INTO public.planet VALUES (7, 'Venus', 7, false, false, 0);
INSERT INTO public.planet VALUES (8, 'Mercury', 7, false, false, 1);
INSERT INTO public.planet VALUES (9, 'uranus', 7, true, false, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 7, true, false, 1);
INSERT INTO public.planet VALUES (11, 'Kepler 186f', 3, false, false, 582);
INSERT INTO public.planet VALUES (12, 'HD 204598', 2, true, false, 153);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 1, true, 4);
INSERT INTO public.star VALUES (2, 'Tau Ceti', 1, true, 12);
INSERT INTO public.star VALUES (3, 'Kepler-186', 1, true, 582);
INSERT INTO public.star VALUES (4, 'Gilese 581', 1, true, 20);
INSERT INTO public.star VALUES (5, 'Kepler 62', 1, true, 1200);
INSERT INTO public.star VALUES (6, '55 Cancri', 1, true, 41);
INSERT INTO public.star VALUES (7, 'Sun', 1, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_with_planet_moon_with_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_with_planet_moon_with_planet_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_with_planet moon_with_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_with_planet
    ADD CONSTRAINT moon_with_planet_pkey PRIMARY KEY (moon_with_planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: moon_with_planet unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_with_planet
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

