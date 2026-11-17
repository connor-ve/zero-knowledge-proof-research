# Zero-Knowledge Proof Research

Undergraduate research project at Cleveland State University (summer 2023) on zero-knowledge proofs and how their arithmetic could be accelerated on GPUs.

The work focused on **Schnorr's protocol**, an honest-verifier zero-knowledge proof built on the hardness of the discrete logarithm problem, and on the large-number modular arithmetic it depends on. That arithmetic (multiplying and reducing numbers hundreds of bits long, modulo a prime) is the expensive part of a proof and the part worth moving to a GPU.

![Schnorr's protocol: messages exchanged between prover and verifier](Images/SPgraph.png)

## What's here

| Path | What it is |
|---|---|
| `src/Sigma_Protocol.py` | A small Python demo of a Schnorr-style sigma protocol: a prover convinces a verifier it knows a secret without revealing it |
| `include/` | Big-number arithmetic in C on byte arrays: multiplication (`multiplier.c`), subtraction (`subtraction.c`), bit shifting (`shifting.c`), and finding the Barrett constant `k` (`findK.c`) |
| `include/Barretts.c` | Barrett reduction on 512-bit operands, built from the routines above |
| `src/SingleWordBarretts.c` | Barrett reduction on single bytes, used to check the algorithm on small values |
| `src/montegomery.c` | Placeholder for Montgomery multiplication (not implemented) |
| `Examples/`, `tests/` | Standalone experiments used while developing the routines |
| `pyth.py` | Helper used to check results in Python |

## Running it

Schnorr demo (Python 3):

```bash
python src/Sigma_Protocol.py
```

Barrett reduction (needs gcc):

```bash
make
./barrett
```

## Status

Archived research code, kept as a record of the project. It is written for learning and is **not** secure: do not use it for real cryptography. The GPU port and the Montgomery multiplication were planned next steps and were not completed.

## Background

- Schnorr, C. P. "Efficient signature generation by smart cards." *Journal of Cryptology*, 1991.
- Barrett, P. "Implementing the Rivest Shamir and Adleman public key encryption algorithm on a standard digital signal processor." *CRYPTO '86*.
- Menezes, van Oorschot and Vanstone. *Handbook of Applied Cryptography*, chapter 14 (efficient implementation).
