import { ReactNode, useEffect, useState } from 'react';
import FavoriteContext from './FavoriteContext';

type Props = {
  children: ReactNode;
};
const FavoriteProvider = ({ children }: Props) => {
  const [favorites, setFavorites] = useState<string[]>([]);

  useEffect(() => {
    fetch('http://localhost:3000/favorites')
      .then((res) => res.json())
      .then((data) => {
        const codes = data.map((c: { cca3: string }) => c.cca3);
        setFavorites(codes);
      })
      .catch((error) => console.error(error));
  }, []);

  const addFavorite = async (code: string) => {
    if (!favorites.includes(code)) {
      try {
        const response = await fetch('http://localhost:3000/favorites', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ cca3: code }),
        });
        if (response.ok) {
          setFavorites((prev) => [...prev, code]);
        } else {
          const errorMsg = await response.json();
          console.error('Cannot add to favorite:', errorMsg);
        }
      } catch (error) {
        console.log(error);
      }
    }
  };
  const removeFavorite = async (code: string) => {
    try {
      const response = await fetch(`http://localhost:3000/favorites/${code}`, {
        method: 'DELETE',
      });

      if (response.ok) {
        setFavorites((prev) => prev.filter((fav) => fav !== code));
      } else {
        const errorMsg = await response.json();
        console.error('Cannot delete favorite:', errorMsg);
      }
    } catch (error) {
      console.error(error);
    }
  };

  const isFavorite = (code: string) => favorites.includes(code);
  const contextValue = {
    favorites,
    addFavorite,
    removeFavorite,
    isFavorite,
  };
  return <FavoriteContext.Provider value={contextValue}>{children}</FavoriteContext.Provider>;
};
export default FavoriteProvider;
