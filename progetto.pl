

% Definizione delle entità
entita(persone, 'Detective Rossi').
entita(persone, 'Giovanni Bianchi').
entita(persone, 'Maria Verdi').
entita(persone, 'Luca Neri').
entita(persone, 'Francesca Gallo').
entita(persone, 'Marco Rossi').
entita(persone, 'Avvocato Smith').
entita(persone, 'Testimone Luca').

entita(luoghi, 'Milano').
entita(luoghi, 'Roma').
entita(luoghi, 'Via Roma 10').
entita(luoghi, 'Tribunale di Milano').

entita(organizzazioni, 'Polizia di Stato').
entita(organizzazioni, 'Carabinieri').
entita(organizzazioni, 'Tribunale').

entita(oggetti, 'arma').
entita(oggetti, 'documenti').
entita(oggetti, 'contratto').

% Sinonimi per le entità
sinonimo('Detective Rossi', 'detective rossi').
sinonimo('Giovanni Bianchi', 'giovanni bianchi').
sinonimo('Maria Verdi', 'maria verdi').
sinonimo('Luca Neri', 'luca neri').
sinonimo('Avvocato Smith', 'avvocato smith').
sinonimo('Tribunale di Milano', 'tribunale di milano').
sinonimo('Polizia di Stato', 'polizia').
sinonimo('Carabinieri', 'carabinieri').

% Definizione delle relazioni
relazione('Detective Rossi', 'Giovanni Bianchi', 'interroga').
relazione('Giovanni Bianchi', 'Maria Verdi', 'denuncia_a').
relazione('Detective Rossi', 'Milano', 'indaga_a').
relazione('Giovanni Bianchi', 'Polizia di Stato', 'collabora_con').
relazione('Maria Verdi', 'Carabinieri', 'denuncia_a').
relazione('Luca Neri', 'arma', 'possiede').
relazione('Giovanni Bianchi', 'documenti', 'fornisce').
relazione('Detective Rossi', 'Via Roma 10', 'visita').
relazione('Avvocato Smith', 'Tribunale di Milano', 'rappresenta').
relazione('Testimone Luca', 'Giovanni Bianchi', 'testimonia_a').
relazione('Detective Rossi', 'Giovanni Bianchi', 'interroga').
relazione('Detective Rossi', 'Tribunale di Milano', 'visita').
relazione('Maria Verdi', 'Giovanni Bianchi', 'testimonia_contro').

% Regola per estrarre entità e relazioni da un discorso
estrai_entita_relazioni(Testo, Entita, Relazioni) :-
    findall(E, (entita(_, E), (sub_string(Testo, _, _, _, E); sinonimo(E, Sinonimo), sub_string(Testo, _, _, _, Sinonimo))), EntitaRaw),
    list_to_set(EntitaRaw, Entita),  % Rimuove i duplicati dalle entità

    findall(R, (relazione(X, Y, R),
                 (sub_string(Testo, _, _, _, X); sinonimo(X, SinonimoX), sub_string(Testo, _, _, _, SinonimoX)),
                 (sub_string(Testo, _, _, _, Y); sinonimo(Y, SinonimoY), sub_string(Testo, _, _, _, SinonimoY))),
            RelazioniRaw),
    list_to_set(RelazioniRaw, Relazioni).  % Rimuove i duplicati dalle relazioni
% Predicato per visualizzare il modello ER
visualizza_modello_er(Entita, Relazioni) :-
    write('Entità trovate:'), nl,
    write(Entita), nl,

    write('Relazioni trovate:'), nl,
    (Relazioni = [] ->
        write('Nessuna relazione trovata.'), nl
    ;
        % Stampa le relazioni in formato "Entità1 - Relazione - Entità2"
        findall((X, Y, R),
                (relazione(X, Y, R),
                 member(X, Entita),
                 member(Y, Entita)),
                RelazioniDettagliate),
        (RelazioniDettagliate = [] ->
            write('Nessuna relazione trovata tra le entità.'), nl
        ;
            forall(member((X, Y, R), RelazioniDettagliate),
                   format('~w - ~w - ~w~n', [X, R, Y]))
        )
    ).
% Predicato principale per analizzare una frase
analizza(Frase) :-
    estrai_entita_relazioni(Frase, Entita, Relazioni),
    visualizza_modello_er(Entita, Relazioni).

% Esempio di utilizzo
esempio :-
    Testo = 'Il detective Rossi ha interrogato Giovanni Bianchi al Tribunale di Milano. Giovanni Bianchi ha denunciato Maria Verdi alla Polizia di Stato.',
    analizza(Testo).
