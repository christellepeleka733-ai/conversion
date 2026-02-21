// Fonction arabe -> romain (1 à 3999)
String arabeRomain(int nombre) {
  if (nombre < 1 || nombre > 3999) {
    throw Exception("Le nombre doit être compris entre 1 et 3999");
  }

  Map<int, String> table = {
    1000: "M",
    900: "CM",
    500: "D",
    400: "CD",
    100: "C",
    90: "XC",
    50: "L",
    40: "XL",
    10: "X",
    9: "IX",
    5: "V",
    4: "IV",
    1: "I"
  };

  String resultat = "";

  table.forEach((valeur, symbole) {
    while (nombre >= valeur) {
      resultat += symbole;
      nombre -= valeur;
    }
  });

  return resultat;
}

// Fonction romain -> arabe (limite 3999)
int romainArabe(String romain) {
  Map<String, int> table = {
    "CM": 900,
    "CD": 400,
    "XC": 90,
    "XL": 40,
    "IX": 9,
    "IV": 4,
    "M": 1000,
    "D": 500,
    "C": 100,
    "L": 50,
    "X": 10,
    "V": 5,
    "I": 1
  };

  int resultat = 0;
  int i = 0;

  while (i < romain.length) {
    if (i + 1 < romain.length &&
        table.containsKey(romain.substring(i, i + 2))) {
      resultat += table[romain.substring(i, i + 2)]!;
      i += 2;
    } else if (table.containsKey(romain.substring(i, i + 1))) {
      resultat += table[romain.substring(i, i + 1)]!;
      i += 1;
    } else {
      throw Exception("Nombre romain invalide");
    }
  }

  if (resultat < 1 || resultat > 3999) {
    throw Exception("Nombre romain hors limite (1 à 3999)");
  }

  return resultat;
}

// Fonction main : tests
void main() {
  try {
    int nombre = 3999;

    // Test arabe -> romain
    String romain = arabeRomain(nombre);
    print("Arabe $nombre → Romain : $romain");

    // Test romain -> arabe
    int resultat = romainArabe(romain);
    print("Romain $romain → Arabe : $resultat");

  } catch (e) {
    print("Erreur : $e");
  }
}
