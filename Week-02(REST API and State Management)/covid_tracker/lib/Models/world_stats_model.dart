class WorldStatsModel {
  int? _updated;
  int? _cases;
  int? _todayCases;
  int? _deaths;
  int? _todayDeaths;
  int? _recovered;
  int? _todayRecovered;
  int? _active;
  int? _critical;
  int? _casesPerOneMillion;
  double? _deathsPerOneMillion;
  int? _tests;
  double? _testsPerOneMillion;
  int? _population;
  int? _oneCasePerPeople;
  int? _oneDeathPerPeople;
  int? _oneTestPerPeople;
  double? _activePerOneMillion;
  double? _recoveredPerOneMillion;
  double? _criticalPerOneMillion;
  int? _affectedCountries;

  WorldStatsModel(
      {int? updated,
      int? cases,
      int? todayCases,
      int? deaths,
      int? todayDeaths,
      int? recovered,
      int? todayRecovered,
      int? active,
      int? critical,
      int? casesPerOneMillion,
      double? deathsPerOneMillion,
      int? tests,
      double? testsPerOneMillion,
      int? population,
      int? oneCasePerPeople,
      int? oneDeathPerPeople,
      int? oneTestPerPeople,
      double? activePerOneMillion,
      double? recoveredPerOneMillion,
      double? criticalPerOneMillion,
      int? affectedCountries}) {
    if (updated != null) {
      _updated = updated;
    }
    if (cases != null) {
      _cases = cases;
    }
    if (todayCases != null) {
      _todayCases = todayCases;
    }
    if (deaths != null) {
      _deaths = deaths;
    }
    if (todayDeaths != null) {
      _todayDeaths = todayDeaths;
    }
    if (recovered != null) {
      _recovered = recovered;
    }
    if (todayRecovered != null) {
      _todayRecovered = todayRecovered;
    }
    if (active != null) {
      _active = active;
    }
    if (critical != null) {
      _critical = critical;
    }
    if (casesPerOneMillion != null) {
      _casesPerOneMillion = casesPerOneMillion;
    }
    if (deathsPerOneMillion != null) {
      _deathsPerOneMillion = deathsPerOneMillion;
    }
    if (tests != null) {
      _tests = tests;
    }
    if (testsPerOneMillion != null) {
      _testsPerOneMillion = testsPerOneMillion;
    }
    if (population != null) {
      _population = population;
    }
    if (oneCasePerPeople != null) {
      _oneCasePerPeople = oneCasePerPeople;
    }
    if (oneDeathPerPeople != null) {
      _oneDeathPerPeople = oneDeathPerPeople;
    }
    if (oneTestPerPeople != null) {
      _oneTestPerPeople = oneTestPerPeople;
    }
    if (activePerOneMillion != null) {
      _activePerOneMillion = activePerOneMillion;
    }
    if (recoveredPerOneMillion != null) {
      _recoveredPerOneMillion = recoveredPerOneMillion;
    }
    if (criticalPerOneMillion != null) {
      _criticalPerOneMillion = criticalPerOneMillion;
    }
    if (affectedCountries != null) {
      _affectedCountries = affectedCountries;
    }
  }

  int? get updated => _updated;
  set updated(int? updated) => _updated = updated;
  int? get cases => _cases;
  set cases(int? cases) => _cases = cases;
  int? get todayCases => _todayCases;
  set todayCases(int? todayCases) => _todayCases = todayCases;
  int? get deaths => _deaths;
  set deaths(int? deaths) => _deaths = deaths;
  int? get todayDeaths => _todayDeaths;
  set todayDeaths(int? todayDeaths) => _todayDeaths = todayDeaths;
  int? get recovered => _recovered;
  set recovered(int? recovered) => _recovered = recovered;
  int? get todayRecovered => _todayRecovered;
  set todayRecovered(int? todayRecovered) => _todayRecovered = todayRecovered;
  int? get active => _active;
  set active(int? active) => _active = active;
  int? get critical => _critical;
  set critical(int? critical) => _critical = critical;
  int? get casesPerOneMillion => _casesPerOneMillion;
  set casesPerOneMillion(int? casesPerOneMillion) =>
      _casesPerOneMillion = casesPerOneMillion;
  double? get deathsPerOneMillion => _deathsPerOneMillion;
  set deathsPerOneMillion(double? deathsPerOneMillion) =>
      _deathsPerOneMillion = deathsPerOneMillion;
  int? get tests => _tests;
  set tests(int? tests) => _tests = tests;
  double? get testsPerOneMillion => _testsPerOneMillion;
  set testsPerOneMillion(double? testsPerOneMillion) =>
      _testsPerOneMillion = testsPerOneMillion;
  int? get population => _population;
  set population(int? population) => _population = population;
  int? get oneCasePerPeople => _oneCasePerPeople;
  set oneCasePerPeople(int? oneCasePerPeople) =>
      _oneCasePerPeople = oneCasePerPeople;
  int? get oneDeathPerPeople => _oneDeathPerPeople;
  set oneDeathPerPeople(int? oneDeathPerPeople) =>
      _oneDeathPerPeople = oneDeathPerPeople;
  int? get oneTestPerPeople => _oneTestPerPeople;
  set oneTestPerPeople(int? oneTestPerPeople) =>
      _oneTestPerPeople = oneTestPerPeople;
  double? get activePerOneMillion => _activePerOneMillion;
  set activePerOneMillion(double? activePerOneMillion) =>
      _activePerOneMillion = activePerOneMillion;
  double? get recoveredPerOneMillion => _recoveredPerOneMillion;
  set recoveredPerOneMillion(double? recoveredPerOneMillion) =>
      _recoveredPerOneMillion = recoveredPerOneMillion;
  double? get criticalPerOneMillion => _criticalPerOneMillion;
  set criticalPerOneMillion(double? criticalPerOneMillion) =>
      _criticalPerOneMillion = criticalPerOneMillion;
  int? get affectedCountries => _affectedCountries;
  set affectedCountries(int? affectedCountries) =>
      _affectedCountries = affectedCountries;

  WorldStatsModel.fromJson(Map<String, dynamic> json) {
    _updated = json['updated'];
    _cases = json['cases'];
    _todayCases = json['todayCases'];
    _deaths = json['deaths'];
    _todayDeaths = json['todayDeaths'];
    _recovered = json['recovered'];
    _todayRecovered = json['todayRecovered'];
    _active = json['active'];
    _critical = json['critical'];
    _casesPerOneMillion = json['casesPerOneMillion'];
    _deathsPerOneMillion = json['deathsPerOneMillion'];
    _tests = json['tests'];
    _testsPerOneMillion = json['testsPerOneMillion'];
    _population = json['population'];
    _oneCasePerPeople = json['oneCasePerPeople'];
    _oneDeathPerPeople = json['oneDeathPerPeople'];
    _oneTestPerPeople = json['oneTestPerPeople'];
    _activePerOneMillion = json['activePerOneMillion'];
    _recoveredPerOneMillion = json['recoveredPerOneMillion'];
    _criticalPerOneMillion = json['criticalPerOneMillion'];
    _affectedCountries = json['affectedCountries'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['updated'] = _updated;
    data['cases'] = _cases;
    data['todayCases'] = _todayCases;
    data['deaths'] = _deaths;
    data['todayDeaths'] = _todayDeaths;
    data['recovered'] = _recovered;
    data['todayRecovered'] = _todayRecovered;
    data['active'] = _active;
    data['critical'] = _critical;
    data['casesPerOneMillion'] = _casesPerOneMillion;
    data['deathsPerOneMillion'] = _deathsPerOneMillion;
    data['tests'] = _tests;
    data['testsPerOneMillion'] = _testsPerOneMillion;
    data['population'] = _population;
    data['oneCasePerPeople'] = _oneCasePerPeople;
    data['oneDeathPerPeople'] = _oneDeathPerPeople;
    data['oneTestPerPeople'] = _oneTestPerPeople;
    data['activePerOneMillion'] = _activePerOneMillion;
    data['recoveredPerOneMillion'] = _recoveredPerOneMillion;
    data['criticalPerOneMillion'] = _criticalPerOneMillion;
    data['affectedCountries'] = _affectedCountries;
    return data;
  }
}
