import { useContext, useEffect, useState } from 'react';
import { CountryCard } from '../Components/CountryCard';
import { CountryType } from './HomePage';
import FavoriteContext from '../Store/FavoriteContext';
import '../Styles/FavoritePage.css';

function FavoritePage() {
  const [favoriteCountries, setFavoriteCountries] = useState<CountryType[]>([]);
  const { favorites } = useContext(FavoriteContext)!;

  useEffect(() => {
    fetch('http://localhost:3000/favorites')
      .then((res) => res.json())
      .then((data) => setFavoriteCountries(data));
  }, [favorites]);

  return (
    <div className="favorite-container">
      <h2>Favorite Countries</h2>
      {favoriteCountries.length > 0 ? (
        <div className="favorite-list">
          {favoriteCountries.map((country) => (
            <CountryCard key={country.cca3} country={country} />
          ))}
        </div>
      ) : (
        <div>
          <h4>No favorite countries</h4>
        </div>
      )}
    </div>
  );
}

export default FavoritePage;
