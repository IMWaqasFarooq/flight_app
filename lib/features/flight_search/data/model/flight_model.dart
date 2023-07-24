class FlightModel {
  bool? status;
  String? message;
  Data? data;

  FlightModel({this.status, this.message, this.data});

  FlightModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sessionId;
  List<Flights>? flights;

  Data({this.sessionId, this.flights});

  Data.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    if (json['flights'] != null) {
      flights = <Flights>[];
      json['flights'].forEach((v) {
        flights!.add(new Flights.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    if (this.flights != null) {
      data['flights'] = this.flights!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Flights {
  String? ticketType;
  Null? isPassportMandatory;
  String? sourceCode;
  String? fareType;
  String? isRefundable;
  String? type;
  List<Passengers>? passengers;
  List<OriginDestinationOptions>? originDestinationOptions;
  FareTotal? fareTotal;

  Flights(
      {this.ticketType,
        this.isPassportMandatory,
        this.sourceCode,
        this.fareType,
        this.isRefundable,
        this.type,
        this.passengers,
        this.originDestinationOptions,
        this.fareTotal});

  Flights.fromJson(Map<String, dynamic> json) {
    ticketType = json['ticketType'];
    isPassportMandatory = json['IsPassportMandatory'];
    sourceCode = json['sourceCode'];
    fareType = json['FareType'];
    isRefundable = json['IsRefundable'];
    type = json['type'];
    if (json['passengers'] != null) {
      passengers = <Passengers>[];
      json['passengers'].forEach((v) {
        passengers!.add(new Passengers.fromJson(v));
      });
    }
    if (json['originDestinationOptions'] != null) {
      originDestinationOptions = <OriginDestinationOptions>[];
      json['originDestinationOptions'].forEach((v) {
        originDestinationOptions!.add(new OriginDestinationOptions.fromJson(v));
      });
    }
    fareTotal = json['fareTotal'] != null
        ? new FareTotal.fromJson(json['fareTotal'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticketType'] = this.ticketType;
    data['IsPassportMandatory'] = this.isPassportMandatory;
    data['sourceCode'] = this.sourceCode;
    data['FareType'] = this.fareType;
    data['IsRefundable'] = this.isRefundable;
    data['type'] = this.type;
    if (this.passengers != null) {
      data['passengers'] = this.passengers!.map((v) => v.toJson()).toList();
    }
    if (this.originDestinationOptions != null) {
      data['originDestinationOptions'] =
          this.originDestinationOptions!.map((v) => v.toJson()).toList();
    }
    if (this.fareTotal != null) {
      data['fareTotal'] = this.fareTotal!.toJson();
    }
    return data;
  }
}

class Passengers {
  List<String>? baggage;
  List<String>? cabinBaggage;
  String? type;
  int? quantity;
  PriceBase? priceBase;
  PriceBase? priceService;
  PriceBase? priceSurcharges;
  List<PriceTaxes>? priceTaxes;
  PriceBase? priceTotal;
  PenaltyDetails? penaltyDetails;

  Passengers(
      {this.baggage,
        this.cabinBaggage,
        this.type,
        this.quantity,
        this.priceBase,
        this.priceService,
        this.priceSurcharges,
        this.priceTaxes,
        this.priceTotal,
        this.penaltyDetails});

  Passengers.fromJson(Map<String, dynamic> json) {
    baggage = json['Baggage'].cast<String>();
    cabinBaggage = json['CabinBaggage'].cast<String>();
    type = json['Type'];
    quantity = json['Quantity'];
    priceBase = json['price_Base'] != null
        ? new PriceBase.fromJson(json['price_Base'])
        : null;
    priceService = json['price_Service'] != null
        ? new PriceBase.fromJson(json['price_Service'])
        : null;
    priceSurcharges = json['price_Surcharges'] != null
        ? new PriceBase.fromJson(json['price_Surcharges'])
        : null;
    if (json['price_Taxes'] != null) {
      priceTaxes = <PriceTaxes>[];
      json['price_Taxes'].forEach((v) {
        priceTaxes!.add(new PriceTaxes.fromJson(v));
      });
    }
    priceTotal = json['price_Total'] != null
        ? new PriceBase.fromJson(json['price_Total'])
        : null;
    penaltyDetails = json['PenaltyDetails'] != null
        ? new PenaltyDetails.fromJson(json['PenaltyDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Baggage'] = this.baggage;
    data['CabinBaggage'] = this.cabinBaggage;
    data['Type'] = this.type;
    data['Quantity'] = this.quantity;
    if (this.priceBase != null) {
      data['price_Base'] = this.priceBase!.toJson();
    }
    if (this.priceService != null) {
      data['price_Service'] = this.priceService!.toJson();
    }
    if (this.priceSurcharges != null) {
      data['price_Surcharges'] = this.priceSurcharges!.toJson();
    }
    if (this.priceTaxes != null) {
      data['price_Taxes'] = this.priceTaxes!.map((v) => v.toJson()).toList();
    }
    if (this.priceTotal != null) {
      data['price_Total'] = this.priceTotal!.toJson();
    }
    if (this.penaltyDetails != null) {
      data['PenaltyDetails'] = this.penaltyDetails!.toJson();
    }
    return data;
  }
}

class PriceBase {
  String? amount;
  String? currencyCode;
  String? decimalPlaces;

  PriceBase({this.amount, this.currencyCode, this.decimalPlaces});

  PriceBase.fromJson(Map<String, dynamic> json) {
    amount = json['Amount'];
    currencyCode = json['CurrencyCode'];
    decimalPlaces = json['DecimalPlaces'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Amount'] = this.amount;
    data['CurrencyCode'] = this.currencyCode;
    data['DecimalPlaces'] = this.decimalPlaces;
    return data;
  }
}

class PriceTaxes {
  String? taxCode;
  String? amount;
  String? currencyCode;
  String? decimalPlaces;

  PriceTaxes(
      {this.taxCode, this.amount, this.currencyCode, this.decimalPlaces});

  PriceTaxes.fromJson(Map<String, dynamic> json) {
    taxCode = json['TaxCode'];
    amount = json['Amount'];
    currencyCode = json['CurrencyCode'];
    decimalPlaces = json['DecimalPlaces'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TaxCode'] = this.taxCode;
    data['Amount'] = this.amount;
    data['CurrencyCode'] = this.currencyCode;
    data['DecimalPlaces'] = this.decimalPlaces;
    return data;
  }
}

class PenaltyDetails {
  String? currency;
  bool? refundAllowed;
  String? refundPenaltyAmount;
  bool? changeAllowed;
  String? changePenaltyAmount;

  PenaltyDetails(
      {this.currency,
        this.refundAllowed,
        this.refundPenaltyAmount,
        this.changeAllowed,
        this.changePenaltyAmount});

  PenaltyDetails.fromJson(Map<String, dynamic> json) {
    currency = json['Currency'];
    refundAllowed = json['RefundAllowed'];
    refundPenaltyAmount = json['RefundPenaltyAmount'];
    changeAllowed = json['ChangeAllowed'];
    changePenaltyAmount = json['ChangePenaltyAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Currency'] = this.currency;
    data['RefundAllowed'] = this.refundAllowed;
    data['RefundPenaltyAmount'] = this.refundPenaltyAmount;
    data['ChangeAllowed'] = this.changeAllowed;
    data['ChangePenaltyAmount'] = this.changePenaltyAmount;
    return data;
  }
}

class OriginDestinationOptions {
  int? totalStops;
  List<TourSegments>? tourSegments;

  OriginDestinationOptions({this.totalStops, this.tourSegments});

  OriginDestinationOptions.fromJson(Map<String, dynamic> json) {
    totalStops = json['TotalStops'];
    if (json['tourSegments'] != null) {
      tourSegments = <TourSegments>[];
      json['tourSegments'].forEach((v) {
        tourSegments!.add(new TourSegments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalStops'] = this.totalStops;
    if (this.tourSegments != null) {
      data['tourSegments'] = this.tourSegments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TourSegments {
  int? seatsRemaining;
  String? flightNumber;
  String? airlineCode;
  String? airlineName;
  String? departureAirportCode;
  String? departureDateTime;
  String? arrivalAirportCode;
  String? arrivalDateTime;
  String? cabinClassCode;
  String? journeyDuration;
  String? cabinClassText;

  TourSegments(
      {this.seatsRemaining,
        this.flightNumber,
        this.airlineCode,
        this.airlineName,
        this.departureAirportCode,
        this.departureDateTime,
        this.arrivalAirportCode,
        this.arrivalDateTime,
        this.cabinClassCode,
        this.journeyDuration,
        this.cabinClassText});

  TourSegments.fromJson(Map<String, dynamic> json) {
    seatsRemaining = json['SeatsRemaining'];
    flightNumber = json['FlightNumber'];
    airlineCode = json['AirlineCode'];
    airlineName = json['AirlineName'];
    departureAirportCode = json['DepartureAirportCode'];
    departureDateTime = json['DepartureDateTime'];
    arrivalAirportCode = json['ArrivalAirportCode'];
    arrivalDateTime = json['ArrivalDateTime'];
    cabinClassCode = json['CabinClassCode'];
    journeyDuration = json['JourneyDuration'];
    cabinClassText = json['CabinClassText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SeatsRemaining'] = this.seatsRemaining;
    data['FlightNumber'] = this.flightNumber;
    data['AirlineCode'] = this.airlineCode;
    data['AirlineName'] = this.airlineName;
    data['DepartureAirportCode'] = this.departureAirportCode;
    data['DepartureDateTime'] = this.departureDateTime;
    data['ArrivalAirportCode'] = this.arrivalAirportCode;
    data['ArrivalDateTime'] = this.arrivalDateTime;
    data['CabinClassCode'] = this.cabinClassCode;
    data['JourneyDuration'] = this.journeyDuration;
    data['CabinClassText'] = this.cabinClassText;
    return data;
  }
}

class FareTotal {
  PriceBase? baseFare;
  PriceBase? serviceTax;
  PriceBase? totalTax;
  PriceBase? total;

  FareTotal({this.baseFare, this.serviceTax, this.totalTax, this.total});

  FareTotal.fromJson(Map<String, dynamic> json) {
    baseFare = json['baseFare'] != null
        ? new PriceBase.fromJson(json['baseFare'])
        : null;
    serviceTax = json['serviceTax'] != null
        ? new PriceBase.fromJson(json['serviceTax'])
        : null;
    totalTax = json['totalTax'] != null
        ? new PriceBase.fromJson(json['totalTax'])
        : null;
    total =
    json['total'] != null ? new PriceBase.fromJson(json['total']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.baseFare != null) {
      data['baseFare'] = this.baseFare!.toJson();
    }
    if (this.serviceTax != null) {
      data['serviceTax'] = this.serviceTax!.toJson();
    }
    if (this.totalTax != null) {
      data['totalTax'] = this.totalTax!.toJson();
    }
    if (this.total != null) {
      data['total'] = this.total!.toJson();
    }
    return data;
  }
}
