--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(50) NOT NULL,
    description text,
    num_of_stars integer,
    num_of_planets integer
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
    name character varying(50) NOT NULL,
    planet_id integer,
    distance numeric(10,2),
    is_satellite boolean
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
    name character varying(50) NOT NULL,
    star_id integer,
    radius numeric(10,2),
    location text,
    is_habitable boolean
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
-- Name: scientist; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scientist (
    scientist_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    moon_id integer,
    galaxy_id integer
);


ALTER TABLE public.scientist OWNER TO freecodecamp;

--
-- Name: scientist_scientist_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.scientist_scientist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scientist_scientist_id_seq OWNER TO freecodecamp;

--
-- Name: scientist_scientist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.scientist_scientist_id_seq OWNED BY public.scientist.scientist_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    mass numeric(10,2),
    temperature integer,
    is_alive boolean
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: scientist scientist_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist ALTER COLUMN scientist_id SET DEFAULT nextval('public.scientist_scientist_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy', 400, 100);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral galaxy', 500, 150);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy', 200, 50);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical galaxy', 100, 20);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral galaxy', 300, 70);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral galaxy', 250, 60);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 384400.00, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 9377.00, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 23460.00, true);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 670900.00, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 1070400.00, true);
INSERT INTO public.moon VALUES (6, 'Titan', 4, 1221870.00, true);
INSERT INTO public.moon VALUES (7, 'Triton', 5, 354759.00, true);
INSERT INTO public.moon VALUES (8, 'Miranda', 5, 129390.00, true);
INSERT INTO public.moon VALUES (9, 'Titania', 6, 435840.00, true);
INSERT INTO public.moon VALUES (10, 'Oberon', 6, 583520.00, true);
INSERT INTO public.moon VALUES (11, 'Tethys', 4, 294619.00, true);
INSERT INTO public.moon VALUES (12, 'Rhea', 4, 527108.00, true);
INSERT INTO public.moon VALUES (13, 'Iapetus', 4, 3560853.00, true);
INSERT INTO public.moon VALUES (14, 'Dione', 4, 377396.00, true);
INSERT INTO public.moon VALUES (15, 'Enceladus', 4, 237948.00, true);
INSERT INTO public.moon VALUES (16, 'Hyperion', 4, 148101.00, true);
INSERT INTO public.moon VALUES (17, 'Prometheus', 4, 139380.00, true);
INSERT INTO public.moon VALUES (18, 'Janus', 4, 151460.00, true);
INSERT INTO public.moon VALUES (19, 'Epimetheus', 4, 151410.00, true);
INSERT INTO public.moon VALUES (20, 'Mimas', 4, 185520.00, true);
INSERT INTO public.moon VALUES (21, 'Nereid', 5, 5513810.00, true);
INSERT INTO public.moon VALUES (22, 'Proteus', 5, 1176470.00, true);
INSERT INTO public.moon VALUES (23, 'Charon', 6, 19571.00, true);
INSERT INTO public.moon VALUES (24, 'Nix', 6, 48694.00, true);
INSERT INTO public.moon VALUES (25, 'Styx', 6, 42656.00, true);
INSERT INTO public.moon VALUES (26, 'Hydra', 6, 64738.00, true);
INSERT INTO public.moon VALUES (27, 'Ariel', 6, 191020.00, true);
INSERT INTO public.moon VALUES (28, 'Umbriel', 6, 266300.00, true);
INSERT INTO public.moon VALUES (29, 'Puck', 6, 8608.00, true);
INSERT INTO public.moon VALUES (30, 'Caliban', 6, 7168.00, true);
INSERT INTO public.moon VALUES (31, 'Sycorax', 6, 12179.00, true);
INSERT INTO public.moon VALUES (32, 'Prospero', 6, 16108.00, true);
INSERT INTO public.moon VALUES (33, 'Setebos', 6, 17794.00, true);
INSERT INTO public.moon VALUES (34, 'Stephano', 6, 20149.00, true);
INSERT INTO public.moon VALUES (35, 'Trinculo', 6, 23508.00, true);
INSERT INTO public.moon VALUES (36, 'S/2003 J 5', 6, 31770.00, true);
INSERT INTO public.moon VALUES (37, 'Francisco', 6, 42810.00, true);
INSERT INTO public.moon VALUES (38, 'Margaret', 6, 140000.00, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371.00, 'Inner Solar System', true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389.00, 'Inner Solar System', false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 69911.00, 'Outer Solar System', false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 58232.00, 'Outer Solar System', false);
INSERT INTO public.planet VALUES (5, 'Neptune', 1, 24622.00, 'Outer Solar System', false);
INSERT INTO public.planet VALUES (6, 'Uranus', 1, 25362.00, 'Outer Solar System', false);
INSERT INTO public.planet VALUES (7, 'Proxima b', 2, 6350.00, 'Alpha Centauri System', true);
INSERT INTO public.planet VALUES (8, 'Kepler-452b', 1, 17334.00, 'Cygnus Constellation', true);
INSERT INTO public.planet VALUES (9, 'HD 189733b', 6, 11000.00, 'Vulpecula Constellation', false);
INSERT INTO public.planet VALUES (10, 'WASP-12b', 5, 152000.00, 'Auriga Constellation', false);
INSERT INTO public.planet VALUES (11, 'TrES-3b', 4, 15700.00, 'Hercules Constellation', false);
INSERT INTO public.planet VALUES (12, 'OGLE-2005-BLG-390Lb', 3, 7000.00, 'Sagittarius Constellation', true);


--
-- Data for Name: scientist; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scientist VALUES (1, 'Galileo Galilei', 1, NULL, 1);
INSERT INTO public.scientist VALUES (2, 'Edwin Hubble', 1, NULL, 1);
INSERT INTO public.scientist VALUES (3, 'Carl Sagan', NULL, 1, 1);
INSERT INTO public.scientist VALUES (4, 'Jocelyn Bell Burnell', 1, 2, NULL);
INSERT INTO public.scientist VALUES (5, 'Albert Einstein', NULL, NULL, 2);
INSERT INTO public.scientist VALUES (6, 'Neil deGrasse Tyson', 2, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.99, 5778, true);
INSERT INTO public.star VALUES (2, 'Polaris', 1, 5.43, 6000, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 2.02, 9940, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 2.93, 3600, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 2.33, 9602, true);
INSERT INTO public.star VALUES (6, 'Antares', 1, 1.23, 3500, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: scientist_scientist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.scientist_scientist_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: scientist scientist_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist
    ADD CONSTRAINT scientist_pkey PRIMARY KEY (scientist_id);


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
-- Name: scientist unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist
    ADD CONSTRAINT unique_name UNIQUE (name);


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
-- Name: scientist scientist_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist
    ADD CONSTRAINT scientist_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: scientist scientist_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist
    ADD CONSTRAINT scientist_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: scientist scientist_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist
    ADD CONSTRAINT scientist_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

