export const register = async (email: string, password: string) => {
  const response = await fetch(`/api/auth/register`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ email, password }),
  })
  if (response.ok) {
    const data = await response.json()
    console.log("success", data)
    return data
  } else {
    throw new Error("Erreur de connexion")
  }
}
