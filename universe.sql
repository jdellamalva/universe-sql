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
    name character varying(30) NOT NULL,
    type character varying(50),
    distance_light_years numeric,
    diameter_light_years numeric,
    number_of_stars bigint,
    discovered_by character varying(100),
    discovery_year integer
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
    name character varying(30) NOT NULL,
    is_spherical boolean,
    orbital_period_days integer,
    mass numeric(10,2),
    common_name text,
    planet_id integer
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    order_from_star integer,
    mass numeric(10,2),
    common_name text,
    star_id integer,
    galaxy_id integer,
    more_info_id integer
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    type character varying(50),
    mass numeric(10,3),
    radius numeric(10,3),
    temperature integer
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 0, 105700, 250000000000, 'Ancient Civilization', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 220000, 1000000000000, 'Abd al-Rahman al-Sufi', 964);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2730000, 60000, 40000000000, 'Giovanni Battista Hodierna', 1654);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 31000000, 76000, 100000000000, 'Charles Messier', 1773);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 29000000, 49000, 80000000000, 'Pierre Méchain', 1781);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 163000, 14000, 30000000000, 'Ferdinand Magellan', 1519);
INSERT INTO public.galaxy VALUES (7, 'Small Magellanic Cloud', 'Irregular', 200000, 7000, 3000000000, 'Ferdinand Magellan', 1519);
INSERT INTO public.galaxy VALUES (8, 'Messier 87', 'Elliptical', 53000000, 120000, 1000000000000, 'Charles Messier', 1781);
INSERT INTO public.galaxy VALUES (9, 'Centaurus A', 'Elliptical', 13000000, 60000, 100000000000, 'James Dunlop', 1826);
INSERT INTO public.galaxy VALUES (10, 'Hoag’s Object', 'Ring', 600000000, 100000, 80000000000, 'Arthur Hoag', 1950);
INSERT INTO public.galaxy VALUES (11, 'Pinwheel', 'Spiral', 21000000, 170000, 100000000000, 'Pierre Méchain', 1781);
INSERT INTO public.galaxy VALUES (12, 'Cartwheel', 'Lenticular', 500000000, 150000, 100000000000, 'Fritz Zwicky', 1941);
INSERT INTO public.galaxy VALUES (13, 'Tadpole', 'Spiral', 420000000, 280000, 100000000000, 'Hubble Space Telescope', 2000);
INSERT INTO public.galaxy VALUES (14, 'Cigar', 'Starburst', 12000000, 37000, 30000000000, 'Johann Elert Bode', 1774);
INSERT INTO public.galaxy VALUES (15, 'Black Eye', 'Spiral', 17000000, 54000, 100000000000, 'Edward Pigott', 1779);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 27, 0.07, 'Luna', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 0, 0.00, 'Fear Moon', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 1, 0.00, 'Dread Moon', 4);
INSERT INTO public.moon VALUES (4, 'Io', true, 2, 0.02, 'Volcanic Moon', 5);
INSERT INTO public.moon VALUES (5, 'Europa', true, 4, 0.01, 'Icy Moon', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 7, 0.15, 'Largest Moon', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 17, 0.11, 'Cratered Moon', 5);
INSERT INTO public.moon VALUES (8, 'Titan', true, 16, 0.13, 'Thick Atmosphere', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 1, 0.00, 'Icy Geysers', 6);
INSERT INTO public.moon VALUES (10, 'Mimas', true, 1, 0.00, 'Death Star Moon', 6);
INSERT INTO public.moon VALUES (11, 'Triton', true, 6, 0.02, 'Retrograde Orbit', 8);
INSERT INTO public.moon VALUES (12, 'Proxima Centauri b I', true, NULL, 0.50, 'Exomoon', 9);
INSERT INTO public.moon VALUES (13, 'Alpha Centauri Bb I', true, NULL, 0.40, 'Exomoon', 10);
INSERT INTO public.moon VALUES (14, 'Sirius Ab I', true, NULL, 0.60, 'Exomoon', 11);
INSERT INTO public.moon VALUES (15, 'Gliese 581g I', true, NULL, 0.70, 'Exomoon', 13);
INSERT INTO public.moon VALUES (16, 'Kepler-22b I', true, NULL, 0.90, 'Exomoon', 14);
INSERT INTO public.moon VALUES (17, 'TRAPPIST-1e I', true, NULL, 0.20, 'Exomoon', 15);
INSERT INTO public.moon VALUES (18, 'HD 209458 b I', true, NULL, 1.10, 'Exomoon', 16);
INSERT INTO public.moon VALUES (19, 'TOI-700d I', true, NULL, 0.60, 'Exomoon', 17);
INSERT INTO public.moon VALUES (20, '55 Cancri e I', true, NULL, 0.80, 'Exomoon', 18);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'Interesting Fact 1', 3);
INSERT INTO public.more_info VALUES (2, 'Historical Data', 5);
INSERT INTO public.more_info VALUES (3, 'Scientific Observation', 7);
INSERT INTO public.more_info VALUES (4, 'Mythological Reference', 8);
INSERT INTO public.more_info VALUES (5, 'Future Exploration Plan', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 1, 0.33, 'Swift Planet', 1, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', false, 2, 4.87, 'Morning Star', 1, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', true, 3, 5.97, 'Blue Planet', 1, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', false, 4, 0.64, 'Red Planet', 1, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 5, 1898.00, 'Gas Giant', 1, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 6, 568.00, 'Ringed Planet', 1, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 7, 86.80, 'Ice Giant', 1, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 8, 102.00, 'Windy Planet', 1, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', false, NULL, 1.27, 'Exoplanet', 2, 1, NULL);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', false, NULL, 1.13, 'Exoplanet', 3, 1, NULL);
INSERT INTO public.planet VALUES (11, 'Sirius Ab', false, NULL, 2.06, 'Exoplanet', 5, 1, NULL);
INSERT INTO public.planet VALUES (12, 'Epsilon Eridani b', false, NULL, 0.86, 'Exoplanet', 6, 1, NULL);
INSERT INTO public.planet VALUES (13, 'Gliese 581g', false, NULL, 3.10, 'Habitable Zone Candidate', 10, 1, NULL);
INSERT INTO public.planet VALUES (14, 'Kepler-22b', false, NULL, 36.00, 'Super-Earth', 11, 1, NULL);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1e', false, NULL, 0.62, 'Exoplanet', 12, 1, NULL);
INSERT INTO public.planet VALUES (16, 'HD 209458 b', false, NULL, 220.00, 'Hot Jupiter', 13, 1, NULL);
INSERT INTO public.planet VALUES (17, 'TOI-700d', false, NULL, 1.72, 'Exoplanet', 14, 1, NULL);
INSERT INTO public.planet VALUES (18, '55 Cancri e', false, NULL, 8.63, 'Diamond Planet', 15, 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Sirius A', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Epsilon Eridani', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (7, 'Vega', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (9, 'Rigel', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (10, 'Gliese 581', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (11, 'Kepler-22', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (12, 'TRAPPIST-1', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (13, 'HD 209458', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (14, 'TOI-700', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (15, '55 Cancri', 1, NULL, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: more_info unique_more_info_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT unique_more_info_id UNIQUE (more_info_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: more_info fk_more_info_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT fk_more_info_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_planet_more_info; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_more_info FOREIGN KEY (more_info_id) REFERENCES public.more_info(more_info_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

