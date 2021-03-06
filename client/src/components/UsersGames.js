import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'

const UsersGames = () => {

    const { id } = useParams();

    const [ userGames, setUserGames ] = useState([])

    useEffect(() => {
        fetch(`/user/consoles/${id}/games`)
        .then(res => res.json())
        .then(data => setUserGames(data))
    }, [])

    const userGamesList = userGames.map(ug => <li key={ug.id} className="pt-5 text-orange-500 font-bold text-xl">{ug.title}: {ug.year} -- {ug.genre}</li>)

    return (
        <ul>
            {userGamesList}
        </ul>
    )
}

export default UsersGames