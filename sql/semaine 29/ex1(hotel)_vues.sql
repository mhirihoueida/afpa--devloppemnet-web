/* Afficher la liste des hôtels avec leur station.*/
CREATE VIEW v_hotels_station
AS
SELECT hot_id , hot_sta_id FROM hotel
WHERE hot_sta_id <>0

/*Afficher la liste des chambres et leur hôtel*/
CREATE VIEW v_chambres_hotel
AS
SELECT cha_id ,cha_hot_id FROM chambre
WHERE cha_hot_id <>0

/* Afficher la liste des réservations avec le nom des client*/
CREATE VIEW v_reservations_clients
AS
SELECT cli_id, cli_nom FROM CLIENT

/* Afficher la liste des chambres avec le nom de l'hôtel et le nom de la station*/
CREATE VIEW v_chambres_hotel_station 
AS
SELECT cha_id ,hot_nom,sta_nom FROM chambre,station,hotel
WHERE hot_id =cha_hot_id and sta_id = hot_sta_id

/* Afficher les réservations avec le nom du client et le nom de l'hôtel*/

CREATE VIEW v_reservation_client_hotel
AS
SELECT cli_nom,hot_nom FROM CLIENT , hotel, chambre 
WHERE hot_id =cha_hot_id 
