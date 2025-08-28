CREATE TABLE ads_spend_ingested (
    date DATE,
    platform VARCHAR(255),
    account VARCHAR(255),
    campaign VARCHAR(255),
    country VARCHAR(255),
    device VARCHAR(255),
    spend DOUBLE PRECISION,
    clicks INTEGER,
    impressions INTEGER,
    conversions INTEGER,
    load_date TIMESTAMP,
    source_file_name VARCHAR(255)
);