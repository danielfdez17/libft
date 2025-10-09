/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: danfern3 <danfern3@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/03 07:46:05 by danfern3          #+#    #+#             */
/*   Updated: 2025/10/07 11:01:59 by danfern3         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

static int	ft_count_words(char const *s, char c)
{
	int	words;
	int	letters;

	words = 0;
	letters = 0;
	while (*s)
	{
		if (*s != c)
			letters++;
		else
		{
			if (letters != 0)
				words++;
			letters = 0;
		}
		s++;
	}
	if (letters != 0)
		words++;
	return (words);
}

static char	*ft_get_segment(char const *s, int i, int letters)
{
	char	*result;
	int		j;

	j = 0;
	result = malloc(sizeof(char) * (letters + 1));
	if (!result)
		return (NULL);
	while (j < letters)
	{
		result[j] = s[i - letters + j];
		++j;
	}
	result[j] = '\0';
	return (result);
}

/**
 * @var counters[0] to iterate the whole string @param s
 * @var counters[1] to iterate every word of @param s
 * @var counters[2] to know the letters of every word of @param s
 */
static void	ft_aux_get_seg(char const *s, char **result, int *counters)
{
	if (counters[2] != 0)
	{
		result[counters[1]] = ft_get_segment(s, counters[0], counters[2]);
		++counters[1];
	}
}

/**
 * @var counters[0] to iterate the whole string @param s
 * @var counters[1] to iterate every word of @param s
 * @var counters[2] to know the letters of every word of @param s
 */
char	**ft_split(char const *s, char c)
{
	char	**result;
	int		counters[3];

	counters[0] = 0;
	counters[1] = 0;
	counters[2] = 0;
	result = malloc(sizeof(char *) * (ft_count_words(s, c) + 1));
	if (!result)
		return (NULL);
	while (s[counters[0]])
	{
		if ((unsigned char) s[counters[0]] != (unsigned char) c)
			++counters[2];
		else
		{
			ft_aux_get_seg(s, result, counters);
			counters[2] = 0;
		}
		++counters[0];
	}
	ft_aux_get_seg(s, result, counters);
	result[counters[1]] = NULL;
	return (result);
}

// #include <stdio.h>
// int main(void)
// {
// 	char const *s = "hola adios adios hola";
// 	char c = 'a';
// 	char **result = ft_split(s, c);
// 	int i = 0;
// 	while (result[i]) {
// 		printf("%s|\n", result[i]);
// 		++i;
// 	}
// 	return (0);
// }