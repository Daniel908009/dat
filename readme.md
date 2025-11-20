# Databáze rezervačního systému letenek

## Popis funkce systému
Cestující si může zarezervovat místo na vybraném letu. Každý let má své označení, datum, čas odletu i příletu, místo odletu a příletu a je realizován konkrétním letadlem.
Každá rezervace se váže na konkrétního cestujícího a konkrétní let.

## Tabulky

### passengers
uchovává informace o všech registrovaných cestujících

### flights
informace o jednotlivých letech mezi letišti

### planes
tabulka letadel používaných společností

### reservations
uchovává informace o všech provedených rezervacích

### seats
uchovává seznam všech sedadel v jednotlivých letadlech

## Obrázek databáze
![ER Diagram](reservations.svg)

## Kód databáze
```
Enum "reservations_state_enum" {
  "confirmed"
  "cancelled"
  "pending"
}

Enum "seats_class_enum" {
  "economy"
  "business"
  "first"
}

Table "flights" {
  "id_flight" int(11) [pk, not null]
  "id_plane" int(11) [not null]
  "departure_place" varchar(100) [not null]
  "arrival_place" varchar(100) [not null]
  "departure_date" date [not null]
  "departure_time" time [not null]
  "arrival_date" date [not null]
  "arrival_time" time [not null]
}

Table "passengers" {
  "id_passenger" int(11) [pk, not null]
  "firstname" varchar(70) [not null]
  "lastname" varchar(70) [not null]
  "email" varchar(100) [not null]
  "phone_number" int(12) [not null]
}

Table "planes" {
  "id_plane" int(11) [pk, not null]
  "type" varchar(100) [not null]
  "capacity" int(11) [not null]
}

Table "reservations" {
  "id_reservation" int(11) [pk, not null]
  "state" reservations_state_enum [not null]
  "passenger" int(11) [not null]
  "flight" int(11) [not null]
  "seat" int(11) [not null]
}

Table "seats" {
  "id_seat" int(11) [pk, not null]
  "plane" int(11) [not null]
  "class" seats_class_enum [not null]
}

Ref "flights_ibfk_1":"planes"."id_plane" < "flights"."id_plane"

Ref "reservations_ibfk_1":"passengers"."id_passenger" < "reservations"."passenger"

Ref "reservations_ibfk_2":"flights"."id_flight" < "reservations"."flight"

Ref "reservations_ibfk_3":"seats"."id_seat" < "reservations"."seat"

Ref "seats_ibfk_1":"planes"."id_plane" < "seats"."plane"
```