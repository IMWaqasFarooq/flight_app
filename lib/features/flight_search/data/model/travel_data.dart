class TravelData {
   String journeyType;
   String departureDate;
   String? returnDate;
   String airportOriginCode;
   String airportDestinationCode;
   String travelClass;
   int adults;
   int children;
   int infants;
   int directFlight;

  TravelData({
     this.journeyType="OneWay",
     this.departureDate="",
     this.returnDate,
     this.airportOriginCode="",
     this.airportDestinationCode="",
     this.travelClass="Economy",
     this.adults=1,
     this.children=0,
     this.infants=0,
     this.directFlight=0,
  });
}