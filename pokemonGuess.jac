"""A Pokémon-Name Guessing Game"""

import random;
import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Give a playful hint about the Pokémon name"""
def give_hint(guess: str, correct_name: str) -> str by llm();

walker PokemonGuessGame {
    has guess: str;

    can start with `root entry;
    can process_guess with turn entry;
}

node turn {
    has correct_name: str = random.choice([
        "Pikachu", "Charizard", "Bulbasaur", "Squirtle", "Charmander",
        "Eevee", "Gengar", "Lucario", "Mewtwo", "Dragonite"
    ]);
}

# CLI entry point
with entry:__main__ {
    root spawn PokemonGuessGame("Pikachu");
    root spawn PokemonGuessGame("Mewtwo");
    root spawn PokemonGuessGame("Eevee");
}