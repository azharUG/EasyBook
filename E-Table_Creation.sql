-- User Table
CREATE TABLE User (
    user_id INTEGER PRIMARY KEY,
    username TEXT NOT NULL
);

-- UserPreference Table
CREATE TABLE UserPreference (
    preference_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    budget REAL, 
    urbanity TEXT, -- Consider using an ENUM type if you have a predefined set of urbanity levels
    weather TEXT, -- Similar to urbanity
    arrival_preference TEXT, 
    departure_preference TEXT, 
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Plan Table
CREATE TABLE Plan (
    plan_id INTEGER PRIMARY KEY, 
    plan_name TEXT,
    cost REAL 
);

-- Provider Table
CREATE TABLE Provider (
    provider_id INTEGER PRIMARY KEY,
    provider_name TEXT,
    contact TEXT
);

-- Property Table
CREATE TABLE Property (
    property_id INTEGER PRIMARY KEY,
    location_id INTEGER NOT NULL,
    amenity_id INTEGER NOT NULL, 
    photo_id INTEGER NOT NULL,
    review_id INTEGER, 
    activity_id INTEGER, 
    property_name TEXT,
    property_description TEXT, 
    FOREIGN KEY (location_id) REFERENCES Location(location_id),
    FOREIGN KEY (amenity_id) REFERENCES Amenities(amenity_id),
    FOREIGN KEY (photo_id) REFERENCES Photos(photo_id),
    FOREIGN KEY (review_id) REFERENCES Review(rating_id),
    FOREIGN KEY (activity_id) REFERENCES Activities(activity_id)
);

-- Location Table
CREATE TABLE Location (
    location_id INTEGER PRIMARY KEY, 
    country TEXT, 
    city TEXT,
    UNIQUE (country, city)
);

-- Neighborhood Table
CREATE TABLE Neighbourhood (
    neighbourhood_name TEXT PRIMARY KEY, 
    location_id INTEGER NOT NULL, 
    neighbourhood_description TEXT,
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
); 

-- Amenities Table
CREATE TABLE Amenities (
    amenity_id INTEGER PRIMARY KEY,
    amenity_name TEXT NOT NULL,
    amenity_description TEXT,
    UNIQUE (amenity_name)
);

-- Photos Table
CREATE TABLE Photos (
    photo_id INTEGER PRIMARY KEY,
    photo_name TEXT, 
    url TEXT
);

-- Review Table
CREATE TABLE Review (
    rating_id INTEGER PRIMARY KEY, 
    rating_type TEXT,
    rating_value TEXT,
    review_date DATE
);

-- Activities Table
CREATE TABLE Activities (
    activity_id INTEGER PRIMARY KEY,
    activity_name TEXT NOT NULL,
    activity_description TEXT,
    age_requirement NUMBER,
    UNIQUE (activity_name)
);

-- Booking Table
CREATE TABLE Booking (
    booking_id INTEGER PRIMARY KEY,
    property_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL, 
    arrival_date DATE NOT NULL,
    departure_date DATE NOT NULL, 
    CHECK (arrival_date < departure_date),
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id) 
);

-- Payment Table
CREATE TABLE Payment (
    payment_id INTEGER PRIMARY KEY,
    booking_id INTEGER NOT NULL,
    total_cost REAL NOT NULL, 
    payment_status TEXT,
    confirmation_code TEXT, 
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

-- Takes Table
CREATE TABLE Takes (
    payment_id INTEGER PRIMARY KEY,  
    paypal_id INTEGER,
    crypto_id INTEGER,
    visa_id INTEGER,
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id),
    FOREIGN KEY (paypal_id) REFERENCES PayPal(paypal_id),
    FOREIGN KEY (crypto_id) REFERENCES Crypto(crypto_id),
    FOREIGN KEY (visa_id) REFERENCES Visa(visa_id)
);

-- PayPal Table
CREATE TABLE PayPal (
    paypal_id INTEGER PRIMARY KEY,
    paypal_name TEXT, -- User or Business name associated with the account
    paypal_email TEXT NOT NULL,
    UNIQUE (paypal_email)  -- Assuming one PayPal email per user
);

-- Visa Table
CREATE TABLE Visa (
    visa_id INTEGER PRIMARY KEY,
    card_number TEXT NOT NULL,
    security_code INTEGER NOT NULL, 
    expiration_date DATE NOT NULL, 
    cardholder_name TEXT,
    UNIQUE (card_number)
);

-- Crypto Table
CREATE TABLE Crypto (
    crypto_id INTEGER PRIMARY KEY,
    crypto_name TEXT NOT NULL,
    crypto_address TEXT NOT NULL, 
    UNIQUE (crypto_address)
); 
