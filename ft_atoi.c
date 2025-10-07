/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: danfern3 <danfern3@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/03 07:45:48 by danfern3          #+#    #+#             */
/*   Updated: 2025/10/06 11:23:52 by danfern3         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

static int	ft_get_result(int result, int negative_counter)
{
	if (negative_counter % 2 == 1)
		return (-result);
	return (result);
}

static int	ft_isspace(int *counters, const char *nptr)
{
	if (nptr[counters[1]] == ' ')
		return (1);
	if (nptr[counters[1]] >= '\t' && nptr[counters[1]] <= '\r')
		return (1);
	return (0);
}

/**
 * @var counters[0] = result
 * @var counters[1] = i
 * @var counters[2] = negative_counter
 * @var counters[3] = positive_counter
 */
int	ft_atoi(const char *nptr)
{
	int	counters[4];

	counters[0] = 0;
	counters[1] = 0;
	counters[2] = 0;
	counters[3] = 0;
	while (ft_isspace(counters, nptr) == 1)
		++counters[1];
	while (nptr[counters[1]] == '+' || nptr[counters[1]] == '-')
	{
		if (nptr[counters[1]] == '+')
			counters[3]++;
		else
			counters[2]++;
		++counters[1];
	}
	while (nptr[counters[1]] >= '0' && nptr[counters[1]] <= '9')
	{
		counters[0] = counters[0] * 10 + (nptr[counters[1]] - '0');
		++counters[1];
	}
	if (counters[2] > 1 || counters[3] > 1 \
		|| (counters[2] >= 1 && counters[3] >= 1))
		return (0);
	return (ft_get_result(counters[0], counters[2]));
}

// #include <stdio.h>
// #include <stdlib.h>
// #include <assert.h>
// int main(int ac, char **av)
// {
// 	int i = 1;
// 	while (--ac)
// 	{
// 		printf("ft_atoi: %d\n", ft_atoi(av[i]));
// 		printf("atoi: %d\n---\n", atoi(av[i]));
// 		assert(ft_atoi(av[i]) == atoi(av[i]));
// 		++i;
// 	}
// 	return (0);
// }