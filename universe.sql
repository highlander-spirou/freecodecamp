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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type character varying(255) NOT NULL,
    distance_center_ly integer NOT NULL,
    diameter_ly integer NOT NULL,
    satelite_of character varying(255)
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
    name character varying(255) NOT NULL,
    diameter_km numeric NOT NULL,
    moon_group_id integer NOT NULL,
    orbital_period_day numeric NOT NULL,
    discovery_year integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_group; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_group (
    moon_group_id integer NOT NULL,
    satellites_type character varying(255) NOT NULL,
    sub_satellites_type character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.moon_group OWNER TO freecodecamp;

--
-- Name: moon_group_moon_group_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_group_moon_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_group_moon_group_id_seq OWNER TO freecodecamp;

--
-- Name: moon_group_moon_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_group_moon_group_id_seq OWNED BY public.moon_group.moon_group_id;


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
    name character varying(255) NOT NULL,
    surface_temperature integer NOT NULL,
    surface_state character varying(255) NOT NULL,
    color_description text,
    has_ring boolean NOT NULL,
    has_life boolean NOT NULL,
    star_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    constellation character varying(255) NOT NULL,
    distance_earth_ly integer NOT NULL,
    magnitude numeric NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: moon_group moon_group_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_group ALTER COLUMN moon_group_id SET DEFAULT nextval('public.moon_group_moon_group_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral galaxy', 0, 100000, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral galaxy', 2650000, 140000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Dwarf', 'dwarf galaxy', 42000, 5000, 'Milky Way');
INSERT INTO public.galaxy VALUES (4, 'Sag DEG', 'dwarf galaxy', 50000, 10000, 'Milky Way');
INSERT INTO public.galaxy VALUES (5, 'LMC', 'dwarf galaxy', 179000, 30000, 'Milky Way');
INSERT INTO public.galaxy VALUES (6, 'SMC', 'dwarf galaxy', 210000, 16000, 'Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'earth moon', 3474.8, 1, 27.0, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Io', 3643.2, 2, 1.8, 1610, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 3121.6, 2, 3.5, 1610, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268.2, 2, 7.2, 1610, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 4820.6, 2, 16.7, 1610, 5);
INSERT INTO public.moon VALUES (6, 'Metis', 43, 3, 0.3, 1979, 5);
INSERT INTO public.moon VALUES (7, 'Adrastea', 16.4, 3, 0.3, 1979, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 167, 3, 0.5, 1892, 5);
INSERT INTO public.moon VALUES (9, 'Thebe', 98.6, 3, 0.7, 1979, 5);
INSERT INTO public.moon VALUES (10, 'Themisto', 9, 4, 130.0, 2000, 5);
INSERT INTO public.moon VALUES (11, 'Leda', 21.5, 6, 240.9, 1974, 5);
INSERT INTO public.moon VALUES (12, 'Ersa', 3, 6, 249.2, 2018, 5);
INSERT INTO public.moon VALUES (13, 'Himalia', 139.6, 6, 250.6, 1904, 5);
INSERT INTO public.moon VALUES (14, 'Pandia', 3, 6, 251.9, 2017, 5);
INSERT INTO public.moon VALUES (15, 'Lysithea', 42.2, 6, 259.2, 1938, 5);
INSERT INTO public.moon VALUES (16, 'Elara', 79.9, 6, 259.6, 1905, 5);
INSERT INTO public.moon VALUES (17, 'Dia', 4, 6, 278.2, 2000, 5);
INSERT INTO public.moon VALUES (18, 'Carpo', 3, 7, 456.3, 2003, 5);
INSERT INTO public.moon VALUES (19, 'Valetudo', 1, 8, 527.6, 2016, 5);
INSERT INTO public.moon VALUES (20, 'Euporie', 2, 5, 550.7, 2001, 5);
INSERT INTO public.moon VALUES (21, 'S/2003 J 18', 2, 5, 598.1, 2003, 5);


--
-- Data for Name: moon_group; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_group VALUES (1, 'natural', NULL, 'natural satelites');
INSERT INTO public.moon_group VALUES (2, 'regular', 'main group', 'Galilean moons');
INSERT INTO public.moon_group VALUES (3, 'regular', 'Inner satellites', 'Amalthea group');
INSERT INTO public.moon_group VALUES (4, 'Irregular', 'Prograde satellites', 'Themisto');
INSERT INTO public.moon_group VALUES (5, 'Irregular', 'Retrograde satellites', 'Ananke');
INSERT INTO public.moon_group VALUES (6, 'Irregular', 'Prograde satellites', 'Himalia');
INSERT INTO public.moon_group VALUES (7, 'Irregular', 'Prograde satellites', 'Carpo');
INSERT INTO public.moon_group VALUES (8, 'Irregular', 'Prograde satellites', 'Valetudo');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 167, 'solid', 'grey, pockmarked, and covered in craters that have been caused by impacting space rocks', false, false, 6);
INSERT INTO public.planet VALUES (2, 'venus', 464, 'solid', 'a yellowish appearance when seen from space, due to the cloud’s absorption of blue light', false, false, 6);
INSERT INTO public.planet VALUES (3, 'earth', 15, 'solid', 'having its “Blue Marble” appearance, along white clouds covering much of the skies', false, true, 6);
INSERT INTO public.planet VALUES (4, 'mars', -65, 'solid', 'reddish-brown, owing to the presence of iron oxide on its surface', false, false, 6);
INSERT INTO public.planet VALUES (5, 'jupiter', -110, 'gas', 'banded appearance, consisting of orange and brown intermixed with bands of white', false, false, 6);
INSERT INTO public.planet VALUES (6, 'saturn', -140, 'gas', 'banded appearance that is due to the peculiar nature of its composition. However, due to Saturn’s lower density, its bands are much fainter and are much wider near the equator.', true, false, 6);
INSERT INTO public.planet VALUES (7, 'uranus', -195, 'ice', 'The presence of methane is what gives Uranus its aquamarine or cyan coloring, which is due to its prominent absorption bands in the visible and near-infrared spectrum', true, false, 6);
INSERT INTO public.planet VALUES (8, 'neptune', -200, 'ice', 'Neptune’s higher proportion of methane and ammonia, along with its greater distance from the Sun (ich results in less illumination) is what leads to Neptune’s darker blue color', true, false, 6);
INSERT INTO public.planet VALUES (9, 'pluto', -225, 'solid', 'grey', false, false, 6);
INSERT INTO public.planet VALUES (10, 'Bellerophon', 967, 'gas', 'grey', false, false, 6);
INSERT INTO public.planet VALUES (11, 'KELT-9b', 4300, 'gas', 'grey', true, false, 6);
INSERT INTO public.planet VALUES (12, 'Kepler-7 b', 1270, 'gas', 'grey', false, false, 6);
INSERT INTO public.planet VALUES (13, 'Methuselah', -201, 'gas', 'grey', false, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Polaris', 'Ursa Minor', 430, 2, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Canis Major', 7, -1.3, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri System', 'Centaurus', 4, -0.26, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'orion', 643, 0.58, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'orion', 864, 0.12, 1);
INSERT INTO public.star VALUES (6, 'Sun', 'Solar', 14816, -26.74, 1);
INSERT INTO public.star VALUES (7, 'Vega', 'lyra', 25, 0.03, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_group_moon_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_group_moon_group_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: moon_group moon_group_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_group
    ADD CONSTRAINT moon_group_name_key UNIQUE (name);


--
-- Name: moon_group moon_group_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_group
    ADD CONSTRAINT moon_group_pkey PRIMARY KEY (moon_group_id);


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
-- Name: moon moon_moon_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_group_id_foreign FOREIGN KEY (moon_group_id) REFERENCES public.moon_group(moon_group_id);


--
-- Name: moon moon_planet_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_foreign FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_foreign FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_foreign FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

