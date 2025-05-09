import { useContext, useEffect, useState } from 'react';
import { CountryCard } from '../Components/CountryCard';
import { CountryType } from './HomePage';
import FavoriteContext from '../Store/FavoriteContext';
import '../Styles/FavoritePage.css';

type FavoriteCountry = CountryType & {
  status: string;
};
function FavoritePage() {
  const [favoriteCountries, setFavoriteCountries] = useState<FavoriteCountry[]>([]);
  const { favorites } = useContext(FavoriteContext)!;

  useEffect(() => {
    fetch('http://localhost:3000/favorites')
      .then((res) => res.json())
      .then((data) => setFavoriteCountries(data));
  }, [favorites]);

  const handleStatusChange = async (cca3: string, newStatus: string) => {
    try {
      const res = await fetch(`http://localhost:3000/favorites/${cca3}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ status: newStatus }),
      });

      if (!res.ok) {
        throw new Error('Failed to update status');
      }

      setFavoriteCountries((prev) =>
        prev.map((c) => (c.cca3 === cca3 ? { ...c, status: newStatus } : c))
      );
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
    } catch (err: any) {
      console.error(err.message);
      alert('Update failed. Please try again.');
    }
  };

  return (
    <div className="favorite-container">
      <h2>Favorite Countries</h2>
      {favoriteCountries.length > 0 ? (
        <div className="favorite-list">
          {favoriteCountries.map((country) => (
            <div key={country.cca3} className="favorite-item">
              <CountryCard country={country} />

              {/* ✅ Dropdown status */}
              <select
                value={country.status || 'wishlist'}
                onChange={(e) => handleStatusChange(country.cca3, e.target.value)}
                className="status-select"
              >
                <option value="wishlist">Wishlist</option>
                <option value="visited">Visited</option>
                <option value="planning">Planning</option>
              </select>
            </div>
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
