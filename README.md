# Mental Health Expert System (Certainty Factor)

A small **expert system** that gives an early screening for four common mental health conditions: **depression**, **generalized anxiety disorder**, **schizophrenia**, and **bipolar disorder**. You answer questions about your symptoms, and it estimates how likely each condition is, as a percentage, using the **Certainty Factor** method.

> This is a student project for learning. It is **not** a medical diagnosis. If you're struggling, please talk to a mental health professional.

The interface is in Indonesian. It has light and dark mode and a video background.

## How it works

1. For each symptom, you pick how sure you are, from **"Pasti"** (certain, 1.0) down to **"Hampir tidak pasti"** (almost not, 0.2).
2. Each **rule** links a condition to a set of symptoms, and an expert has given each rule a confidence value.
3. A rule fires only if you answered **all** of its symptoms. Its score is:

   ```
   CF(rule) = lowest CF among your answers for that rule × expert CF
   ```

4. If several rules point to the same condition, their scores are combined:

   ```
   CF(combined) = CF(old) + CF(new) × (1 − CF(old))
   ```

5. The condition with the highest combined score is shown as the most likely result.

The method is based on this research paper: https://jsisfotek.org/index.php/JSisfotek/article/view/70/70

## Tech stack

PHP (no framework), MySQL/MariaDB, CSS variables for the light/dark themes, JavaScript

## Getting started

You need PHP 7+ and MySQL or MariaDB (XAMPP or Laragon works well).

1. Copy the project into your web server folder, for example `htdocs/sp_gangguanjiwa`.
2. Create a database called `sp_gangguan_jiwa` and import `sp_gangguan_jiwa.sql`.
3. Open `config/config.php` and set your database username and password.
4. Visit http://localhost/sp_gangguanjiwa in your browser.

## Project structure

```
config/config.php     Database connection
css/style.css         Styles, including the light/dark themes
js/script.js          Dark mode toggle and form checks
media/                Profile photo and background video
diagnosis.php         The Certainty Factor calculation
index.php             Main page and symptom form
sp_gangguan_jiwa.sql  Database
```

### Database tables

| Table | What it holds |
| --- | --- |
| `penyakit` | Conditions |
| `gejala` | Symptoms |
| `rules`, `detail_rule` | Rules, their expert CF, and which symptoms each rule needs |
| `nilai_kepastian` | The answer choices and their CF values |

## License

MIT
