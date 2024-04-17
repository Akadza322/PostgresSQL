create table if not exists Band (
	band_id int primary key,
	name text not null
);

create table if not exists Style (
	style_id int primary key,
	name text not null
);

create table if not exists style_band (
	band_id int references Band(band_id),
	style_id int references Style(style_id)
);

create table if not exists Album (
	album_id int primary key,
	name text not null,
	band_id int references Band(band_id),
	release_years date not null
);

create table if not exists Tracks(
	track_id int primary key,
	name text not null,
	duration numeric not null,
	album_id int references Album(album_id)
);

create table if not exists Feat(
	band_id int references Band(band_id),
	album_id int references Album(album_id)
);

create table if not exists Collection(
	collection_id int primary key,
	name text not null,
	release_years date not null
);

create table if not exists Collection_create(
	collection_id int references Collection(collection_id),
	album_id int references Album(album_id),
	track_id int references Tracks(track_id)
);
