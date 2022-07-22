---
title: "Survey"
slug: lesson-survey
layout: page
---

{% if site.kind == lesson %}
{% assign link_title = site.form_title %}
{% else %}
{% assign link_title = page.slug %}
{% endif %}

{% if site.startdate == "TBC" %}
<p><a href="https://docs.google.com/forms/d/e/1FAIpQLScX7g5AZ6sV7TzA4VPPrvBua55lD_rnif6GiPD2_TnuNBBlpg/viewform?usp=pp_url&entry.1679853141={{ link_title }}">Post-Lesson Survey</a></p>
{% else %}
<p><a href="https://docs.google.com/forms/d/e/1FAIpQLScX7g5AZ6sV7TzA4VPPrvBua55lD_rnif6GiPD2_TnuNBBlpg/viewform?usp=pp_url&entry.1679853141={{ link_title }}&entry.1100485531={{ site.startdate }}">Post-Lesson Survey</a></p>
{% endif %}

{% include links.md %}
