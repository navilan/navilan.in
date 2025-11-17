---
title: "Math is Everywhere"
date: "2025-11-05"
og_image: "/en/writings/2025/mie/narasimha.jpg"
tags: [navilan, blog, math, philosophy, stories]
description: "Dear Prahlad, where is Math?"
pageType: "essay"
author_twitter: "navilan"
published: "2025-11-05"
modified: "2025-11-05"
image_source: "/en/writings/2025/mie/narasimha.jpg"
---

This article mindfully wanders through Stories, Mythology, Philosophy and Math aiming to throw light on wonder and beauty when we are willing to open our minds and look at life and knowledge, aware that we are looking at infinity through a kaleidoscope and we can rotate the kaleidoscope to see the same beauty in a different form. Let's start with a small part of my story.

I was given the name Lakshmi Narasimhan. As is customary in the part of India where we live, it is prefixed with my father's first name as initial, making it *V. LAkshmI NArasimhaN*. When I started writing poetry and wanted a pen name, my aunt, who wrote poetry and inspired me to be a poet, suggested that I use *Navilan*, derived from my given name.

Navilan, as a Tamil word, also beautifully translates to *one who speaks*. A few years back I assumed it as my primary identity for various reasons and expanded its meaning to *one who speaks the truth* and have tried my best to live by it. My given name also has a fantastic story behind it.

## The Story of Narasimha

<a class="row-wise-full" title="Gita Press Gorakhpur, CC0, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:God_Narasimha.jpg"><img width="512" alt="Narasimha, Hiranyakashipu and Prahlad" src="/en/writings/2025/mie/narasimha.jpg"></a>

Once upon a time there was a pious king Hiranyakashipu. His brother Hiranyaksha is slain by the boar avatar of Vishnu when he tried to submerge the world beneath the cosmic ocean. Angered and seeking to be more powerful than Vishnu, with intense piety, he calls upon Vishnu's coconspirators, Brahma and Shiva. He asks Shiva for supreme control of weapons and instruments. Pleased by his devotion, Shiva grants the wish.

He asks Brahma for invincibility. Brahma refuses as he cannot give him such a blanket wish and requests him to be specific. Hiranyakashipu wishes that he cannot be slain by a man or beast, a god or human, born or dead, inside or outside, day or night, weapons of wood or metal. Brahma, happy with the specificity, grants it. With the two wishes under his belt, Hiranyakashipu conquers the three worlds and enforces a rule that his citizens worship him and only him. His citizens, living in peace and harmony, do as asked without needing coercion.

Hiranyakashipu rules in comfort and later becomes a father to a baby boy, Prahlad. Prahlad, however, refuses to obey his father's wish and becomes an ardent devotee of Vishnu. Hiranyakashipu, in extreme frustration, uses violent and non-violent means to coerce Prahlad. Every one of his attempts fails. Pushed to the edge, he asks Prahlad, "Where is Vishnu?". Prahlad says he is everywhere. "Is he in this pillar?". "Yes, of course".

Hiranyakashipu breaks open the pillar. Vishnu springs out of the pillar with a lion's head (*simha*) and a man's body (*nara*), neither born nor dead, but materialized. Not by day or by night, but in the evening. Narasimha drags the king over to the doorstep, neither inside nor outside and kills him with fingernails, made neither with wood nor metal.

## A Story of Math

<a title="Nick Dillinger, Public domain, via Wikimedia Commons" class="inline-block" href="https://commons.wikimedia.org/wiki/File:Russell,_Whitehead_-_Principia_Mathematica_to_56.jpg"><img width="256" class="col-wise" alt="Russell, Whitehead - Principia Mathematica to 56" src="https://upload.wikimedia.org/wikipedia/commons/2/27/Russell%2C_Whitehead_-_Principia_Mathematica_to_56.jpg?20090302110457"></a>

In 1910, [Alfred North Whitehead][whitehead] and [Bertrand Russell][russell] published their comprehensive work on mathematical logic, [Principia Mathematica][mathematica]. It set out to devise a fundamental and complete system of mathematics with three well defined goals:

1. **Reduction**: The system will use the absolute minimal set of axioms and rules.
2. **Expression**: The system will use the most convenient notation for symbolic logic to maximize its expressive power.
3. **Resolution**: The system will use the clarity gained from 1 and 2 to resolve all known paradoxes.

[whitehead]: https://en.wikipedia.org/wiki/Alfred_North_Whitehead
[russell]: https://en.wikipedia.org/wiki/Bertrand_Russell
[mathematica]: https://en.wikipedia.org/wiki/Principia_Mathematica

While there were reservations and critiques, it was widely accepted that the authors had accomplished the three goals they had set out to conquer. In 1931, [Kurt Gödel][godel] published two theorems that proved not only that the Principia was incomplete, but any such system would be deemed incomplete. He employed the [diagonal argument][diagonal] to demonstrate his proof. [Douglas Hofstadter's][DH] [Gödel, Escher, Bach][GEB] is a fantastic read if you'd like to experience a thorough unravelling of the argument.

[godel]: https://en.wikipedia.org/wiki/Kurt_Gödel
[diagonal]: https://en.wikipedia.org/wiki/Cantor%27s_diagonal_argument
[DH]: https://en.wikipedia.org/wiki/Douglas_Hofstadter
[GEB]: https://en.wikipedia.org/wiki/Gödel%2C_Escher%2C_Bach

## The Math in the Story

What do these three stories above have in common? You'd be surprised. When Hiranyakashipu was directed to request a wish, he kept it simple and just laid out *neither man nor beast*. In his universe, this was the complete set.

| Head | Body |
|------|------|
| Human | Human |
| Lion | Lion |

Brahma, being the creator, knew something he didn't. That the table can be expanded. Vishnu turned the table by adding a row:

| Head  | Body  |
| ----- | ----- |
| Human | Human |
| Lion  | Lion  |
| Lion{.blue}  | Human{.blue} |

When Narasimha sprung out of the pillar, Hiranyakashipu must have yelled out in his mind, **This is cheating!** Now, let's say that he knew what Brahma knew, that a new row can be added to the table. How would he structure his wish?

He could add that additional row and make a wish. But Vishnu would simply add one more row.

| Head  | Body  |
| ----- | ----- |
| Human | Human |
| Lion  | Lion  |
| Lion  | Human |
| Human{.red} | Lion{.red} |

Not only can there be a new row, but a new column as well.

| Head        | Hair       | Body       |
| ----------- | ---------- | ---------  |
| Human       | Human      | Human      |
| Lion        | Lion       | Lion       |
| Lion        | Human      | Human      |
| Human       | Lion       | Human      |

They can make it a race and keep this up for all eternity. So, we are looking at a table with an infinite number of rows and an infinite number of columns.

| Head  | Hair  | Eyes | Nose | Mouth | Neck | ... |
| ----- | ----- | -----|------|-------|------|-----|
| Human | Human | Human| Human|Human  |Human | ... |
| Lion  | Lion  | Lion | Lion | Lion  | Lion | ... |
| Lion  | Human | Lion | Lion | Lion  | Lion | ... |
| Lion  | Lion | Human | Lion | Lion  | Lion | ... |
| ...   | ...   | ...  | ...  | ...   | ...  | ... |

To make his wish, Hiranyakashipu has to construct this table and state that he cannot be killed by any row in that table. Instead of constructing the actual table, which would take infinite amount of time, he can construct a logical one defined by some generative rules. Let's assume that he makes that wish and Brahma grants it. As soon as it is granted, Vishnu will use the diagonal argument to counter it. How?

If there are rows  r~1~ through r~n~, Vishnu will construct a new row r~n+1~ that will use the elements of the diagonal in the table. That is, r~11~, r~22~,..., r~nn~.

| Head  | Hair  | Eyes | Nose | Mouth | Neck | ... |
| ----- | ----- | -----|------|-------|------|-----|
| **Human**{.blue} | Human | Human| Human|Human  |Human | ... |
| Lion  | **Lion**{.blue}  | Lion | Lion | Lion  | Lion | ... |
| Lion  | Human | **Lion**{.blue} | Lion | Lion  | Lion | ... |
| Lion  | Lion | Human | **Lion**{.blue} | Lion  | Lion | ... |
| ...   | ...   | ...  | ...  | **...**{.blue}   | ...  | ... |

Then he will slightly modify each of the elements and insert it as a new row. He will take **that** avatar and slay Hiranyakashipu again.

| Head  | Hair  | Eyes  | Nose  | Mouth | Neck  | ... |
| ----- | ----- | ----- | ----- | ----- | ----- | --- |
| Human | Human | Human | Human | Human | Human | ... |
| Lion  | Lion  | Lion  | Lion  | Lion  | Lion  | ... |
| Lion  | Human | Lion  | Lion  | Lion  | Lion  | ... |
| Lion  | Lion | Human | Lion | Lion  | Lion | ... |
| **Lion**{.red}  | **Human**{.red} | **Human**{.red}  | **Human**{.red}  | **...**{.red}  | **...**{.red}  | ... |
| ...   | ...   | ...   | ...   | ...   | ...   | ... |

Hiranyakashipu can once again scream, **cheating** to Brahma, stating that the new row cannot be proven to be unique. Then, Brahma will present him with the diagonal argument.

> Remember, Vishnu changed each column. So, r~(n+1)1~ ≠ r~11~. That is, the first column of r~n+1~, the new row, is different from the first column of the first row, r~1~. Since that column is different, the rows are different, so, r~n+1~ ≠ r~1~. Similarly, r~(n+1)2~ ≠ r~12~, so, r~n+1~ ≠ r~2~. And so on till r~n+1~ ≠ r~n~. So, you see Hiranyakashipu, that row is totally new and you were right to be slain.

## The Reality of Time

![Clock](/en/writings/2025/mie/clock.png){.col-wise-small}

Now let's talk about the other part of Hiranyakashipu's wish. That he can neither be slain by day or by night. What if he follows the same approach as before and adds evening to his list? Day, night or evening. Then Vishnu might pick afternoon. What if he includes afternoon? Vishnu might then pick twilight. This goes on and on and soon, we will enter the realm of real numbers venturing into hours, minutes, seconds, milliseconds, microseconds, nanoseconds and so on.

Hiranyakashipu encounters Zeno's [paradox of motion][motion].

[motion]: https://en.wikipedia.org/wiki/Zeno%27s_paradoxes#Paradoxes_of_motion

> That which is in locomotion must arrive at the half-way stage before it arrives at the goal.

And through his eyes we may see that motion in time is similar to motion in space as the paradox of motion applies to moving through time as well.

## Synthesis of Ideas

[![Yin Yang](/en/writings/2025/mie/yin-yang.png)](https://en.wikipedia.org/wiki/Yin_and_yang){.col-wise-small}

[Hegel][] takes a different approach to the same completeness problem by proposing that there is an *abstract incomplete*. The existence of such an incomplete gives rise to its dual the *negative incomplete*. These two combine to form a *concrete complete*.

In casual terms, this is often spoken as *Thesis, Anti-thesis and Synthesis*. We can take any of Hiranyakashipu's wishes and use Hegel's dialectic to reason with. Let's take the *neither born nor dead* wish.

By coming out of the pillar, an inanimate object, Narasimha was not born. By being alive and filled with rage, he is not dead. If being born is considered abstract incomplete and being dead is its negative, Narasimha was the synthesis - neither born nor dead and its equivalent both born and dead.

::: quote-preserve
The Way gave birth to one.
One gave birth to two.
Two gave birth to three.
Three gave birth to all things.
&mdash; Tao Te Ching, Chapter 42.{.not-prose}
:::

[Hegel]:https://en.wikipedia.org/wiki/Dialectic#Hegelian_dialectic

------------

[![Echoes of Each Other](/en/writings/2025/mie/eoeo.jpg)][eoeo]{.col-wise-small}

This article told three stories and from their pillars came out math and philosophy. If you found this interesting, have a look at the [echoes of each other][eoeo] project.

[eoeo]: https://eoeo.one
