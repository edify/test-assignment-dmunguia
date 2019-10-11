const calendar = require('./calendar');

const leapYears = [
  1804,
  1808,
  1812,
  1816,
  1820,
  1824,
  1824,
  1832,
  1836,
  1840,
  1844,
  1848,
  1852,
  1856,
  1860,
  1864,
  1868,
  1872,
  1876,
  1880,
  1884,
  1888,
  1892,
  1896,
  1904,
  1908,
  1912,
  1916,
  1920,
  1924,
  1928,
  1932,
  1936,
  1940,
  1944,
  1948,
  1952,
  1956,
  1960,
  1964,
  1968,
  1972,
  1976,
  1980,
  1984,
  1988,
  1992,
  1996,
  2000,
  2004,
  2008,
  2012,
  2016,
  2020,
  2024,
  2028,
  2032,
  2036,
  2040,
  2044,
  2048,
  2052,
  2056,
  2060,
  2064,
  2068,
  2072,
  2076,
  2080,
  2084,
  2088,
  2092,
  2096
];

for (var year = 1800; year <= 2200; year++) {
  test('isLeapYear should be true if year is a leap year', function() {
    expect(calendar.isLeapYear(year)).toEqual(leapYears.indexOf(year) > -1);
  });
}
