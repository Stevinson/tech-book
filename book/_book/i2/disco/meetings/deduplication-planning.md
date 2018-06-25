# Deduplication planning

(record) -> filter DeduplicateDataRecords -> (record) -> deduplicate + events + layouts -> events
                        |                                       [above done by context builder]
                        ^
                    duplicates


Where everything to the right of the second record is chart aware.
