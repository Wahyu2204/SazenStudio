if (already_triggered && dialog_index < array_length(dialog_list)) {
    draw_dialogue_box(
        dialog_speaker[dialog_index],
        dialog_list[dialog_index],
        char_index,
        dialog_portrait[dialog_index],
        dialog_mirror[dialog_index]
    );
}