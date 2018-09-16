from django.db import models


class Anschrift(models.Model):
    strasse = models.IntegerField(default=None)
    plz = models.IntegerField(default=None)
    ort = models.CharField(max_length=25, null=True)
    land = models.CharField(max_length=25, null=True)


class Kontaktdaten(models.Model):
    vorname = models.CharField(max_length=50, null=True)
    nachname = models.CharField(max_length=50, null=True)
    telefon = models.CharField(max_length=25, null=True)
    handy = models.CharField(max_length=25, null=True)
    fax = models.CharField(max_length=50, null=True)
    mail = models.CharField(max_length=50, null=True)
    homepage = models.CharField(max_length=75, null=True)


class Kunden(models.Model):
    anschrift = models.ForeignKey(Anschrift, on_delete=models.CASCADE)
    kontakt = models.ForeignKey(Kontaktdaten, on_delete=models.CASCADE)
    firma = models.CharField(max_length=50, null=True)


class Projekt(models.Model):
    projektleitung = models.ForeignKey(Kontaktdaten, on_delete=models.CASCADE, related_name='projektleitung')
    regieleitung = models.ForeignKey(Kontaktdaten, on_delete=models.CASCADE, related_name='regieleitung')
    kunde = models.ForeignKey(Kunden, on_delete=models.CASCADE)
    name = models.CharField(max_length=50, null=True)
    beginn = models.DateTimeField(blank=True, null=True)
    ende = models.DateTimeField(blank=True, null=True)
    anmerkung = models.TextField(null=True)


class Kostenkalkulation(models.Model):
    projekt = models.ForeignKey(Projekt, on_delete=models.CASCADE)
    titel = models.CharField(max_length=50, null=True)
    datum = models.DateTimeField(blank=True, null=True)


class Rechnung(models.Model):
    projekt = models.ForeignKey(Projekt, on_delete=models.CASCADE)
    titel = models.CharField(max_length=50, null=True)
    datum = models.DateTimeField(blank=True, null=True)


class Positionen(models.Model):
    rechnung = models.ForeignKey(Rechnung, on_delete=models.CASCADE)
    kalkulation = models.ForeignKey(Kostenkalkulation, on_delete=models.CASCADE)
    anzahl = models.IntegerField(default=None)


class Produkt(models.Model):
    bezeichnung = models.CharField(max_length=50, null=True)
    einheit = models.CharField(max_length=50, null=True)
    kategorie = models.CharField(max_length=50, null=True)
    marke = models.CharField(max_length=50, null=True)
    preis = models.FloatField(null=True)



