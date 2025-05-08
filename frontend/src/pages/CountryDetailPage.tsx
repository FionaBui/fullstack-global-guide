// Import necessary hooks and types
import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { CountryType } from './HomePage';
// Import FontAwesome icons
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {
  faMapLocationDot,
  faCity,
  faChessRook,
  faCube,
  faCircleNodes,
  faUserGroup,
  faLanguage,
  faCoins,
  faClock,
} from '@fortawesome/free-solid-svg-icons';
import '../Styles/CountryDetailPage.css';

function CountryDetailPage() {
  // Get country code from the route parameter
  const { code } = useParams();
  // State for the selected country
  const [country, setCountry] = useState<CountryType | null>(null);
  // Fetch the selected country
  useEffect(() => {
    fetch(`http://localhost:3000/countries/${code}`)
      .then((res) => res.json())
      .then((data) => setCountry(data));
  }, [code]);
  // Show loading while data is being fetched
  if (!country) return <p>Loading...</p>;

  const languages = country.languages ? JSON.parse(country.languages) : [];
  const borders = country.borders ? JSON.parse(country.borders) : [];
  const currencies = country.currencies ? JSON.parse(country.currencies) : [];
  const timezones = country.timezones ? JSON.parse(country.timezones) : [];

  return (
    <div className="detail-container">
      <div className="detail-contents">
        <div className="detail-header">
          <img src={country.flag} alt={`Flag of ${country.name}`} />
          <h1>{country.name}</h1>
        </div>
        <table className="detail-body">
          <tbody>
            <tr>
              <td>
                <FontAwesomeIcon icon={faMapLocationDot} className="icon" />{' '}
                <strong> Region:</strong>
              </td>
              <td>{country.region}</td>
            </tr>
            <tr>
              <td>
                <FontAwesomeIcon icon={faChessRook} className="icon" />
                <strong> Subregion:</strong>
              </td>
              <td>{country.subregion}</td>
            </tr>
            <tr>
              <td>
                <FontAwesomeIcon icon={faCity} className="icon" />
                <strong> Capital:</strong>
              </td>
              <td>{country.capital}</td>
            </tr>
            <tr>
              <td>
                <FontAwesomeIcon icon={faCube} className="icon" /> <strong> CCA3 Code:</strong>
              </td>
              <td>{country.cca3}</td>
            </tr>
            <tr>
              <td>
                <FontAwesomeIcon icon={faCircleNodes} className="icon" /> <strong>Borders:</strong>
              </td>
              <td>{borders.length ? borders.join(', ') : 'None'}</td>
            </tr>
            <tr>
              <td>
                <FontAwesomeIcon icon={faUserGroup} className="icon" />{' '}
                <strong> Population:</strong>
              </td>
              <td>{country.population}</td>
            </tr>
            <tr>
              <td>
                <FontAwesomeIcon icon={faLanguage} className="icon" /> <strong>Languages:</strong>
              </td>
              <td>{languages.length ? languages.join(', ') : 'N/A'}</td>
            </tr>
            <tr>
              <td>
                <FontAwesomeIcon icon={faCoins} className="icon" /> <strong>Currencies:</strong>
              </td>
              <td>{currencies.length ? currencies.join(', ') : 'N/A'}</td>
            </tr>
            <tr>
              <td>
                <FontAwesomeIcon icon={faClock} className="icon" /> <strong>Timezones:</strong>
              </td>
              <td>{timezones.length ? timezones.join(', ') : 'N/A'}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default CountryDetailPage;
