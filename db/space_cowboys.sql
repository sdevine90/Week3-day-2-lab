DROP TABLE space_cowboys;
CREATE TABLE space_cowboys(
  id SERIAL8 primary key,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT4,
  danger_level VARCHAR(255),
  last_known_location VARCHAR(255),
  homeworld VARCHAR(255),
  favourite_weapon VARCHAR(255),
  cashed_in BOOLEAN,
  collected_by VARCHAR(255)
);
