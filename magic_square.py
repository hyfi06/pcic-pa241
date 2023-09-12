import sys

from elapsed_time.decorators import execution_time
from elapsed_time.tools import print_time


def is_valid_square(board: list[list[int]], n: int):
    """Revisa si el tablero actual es un cuadrado mágico."""
    expected_sum: int = n * (n**2 + 1) // 2  # Constante Magica

    # Revisar las sumas de las filas y las columnas
    for i in range(n):
        if sum(board[i]) != expected_sum:
            return False
        if sum([board[j][i] for j in range(n)]) != expected_sum:
            return False

    # Revisar las diagonales
    if sum(board[i][i] for i in range(n)) != expected_sum:
        return False
    if sum(board[i][n-1-i] for i in range(n)) != expected_sum:
        return False

    return True


def is_acceptable(board: list[list[int]], n: int):
    """Revisa si el tablero actual puede ser un cuadro mágico."""
    expected_sum = n * (n**2 + 1) // 2  # Constante Magica
    for row in board:
        if (min(row) != 0 and sum(row) != expected_sum) or (sum(row) > expected_sum):
            return False

    for column in [[row[i] for row in board] for i in range(n)]:
        if (min(column) != 0 and sum(column) != expected_sum) or (sum(row) > expected_sum):
            return False
    diag45 = [board[i][i] for i in range(n)]
    if (min(diag45) != 0 and sum(diag45) != expected_sum) or (sum(row) > expected_sum):
        return False

    diag135 = [board[i][n-1-i] for i in range(n)]
    if (min(diag135) != 0 and sum(diag135) != expected_sum) or (sum(row) > expected_sum):
        return False

    return True


def print_board(board: list[list[int]]):
    n = len(board)
    print_time()
    print("-" * (n * 5 + 1))
    for i in range(n):
        for j in range(n):
            print(f"| {board[i][j]:2d} ", end="")
        print("|")
        print("-" * (n * 5 + 1))
    print()


def magic_square_backtrack(board: list[list[int]], n: int, row: int, col: int, numbers_left: list[int]):
    """Función recursiva de backtracking."""

    # Si hemos llenado el tablero, revisamos si es un cuadrado mágico
    if len(numbers_left) == 0:
        if is_valid_square(board, n):
            # Imprime el cuadrado si cumple la validación
            print_board(board)
        return

    # Prueba cada número disponible
    for num in numbers_left:
        # Seleccionamos una nueva Opción
        board[row][col] = num
        if is_acceptable(board, n):
            # Determina la siguiente celda
            next_row, next_col = row, col + 1
            if next_col == n:
                next_row += 1
                next_col = 0
            # Llama recursiva con el número colocado
            magic_square_backtrack(
                board,
                n,
                next_row,
                next_col,
                [x for x in numbers_left if x != num]
            )
    # Deshacer la acción (backtrack)
    board[row][col] = 0


@execution_time
def generate_magic_squares(n: int):
    """Generar todos los cuadrados mágicos de tamaño nxn."""
    board: list[list[int]] = [[0] * n for _ in range(n)]
    # Universo de numeros a conciderar dado la longitud n
    numbers: list[int] = [i+1 for i in range(n*n)]
    magic_square_backtrack(board, n, 0, 0, numbers)


if __name__ == '__main__':
    n: int = int(sys.argv[1])
    generate_magic_squares(n)
